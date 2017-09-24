# Statelessness

HTTP is a state-less protocol in the sense that HTTP sessions last for one request: the clients sends a request, and the server sends a response. Each request/response is independent (and unaware) of previous or future ones. The server does not keep information between request/response cycles. This is one of the foundations of a distributed and resilient web.

In order to create a stateful experience, applications usually persist state across distinct HTTP requests by means of sessions - basically places to store data during one request that can be read during later requests. There are different ways to store session data: in cookies (in this case all session information is passed between client and server with each request and response), or on the server in memory/cache or a database (in this case only a session identifier is passed between server and client by means of a cookie).

# HTTP State Management Mechanism (aka Cookies)

Cookies are key-value pairs (`name=value`, separated by `;`) that are stored on the on the client side. Plain text, max 4KB. They are sent with the response to the client, which stores it, and sends it back to the server with each request it makes:
* HTTP response header sent by the server: `Set-Cookie: ...`
* HTTP request header sent by the client: `Cookie: ...`

Cookies can contain session information or a session identifier, which allows the server to relate different requests to each other.

Pre-defined properties include an expiration date ( in `Wdy, DD-Mon-YYYY HH:MM:SS GMT` format) and a scope:
* _Session cookies_ is temporary data that is deleted when the client application (e.g. browser) is closed. They have a set `discard` parameter or don't have an `expires`/`max-age` parameter that indicates an extended life time. _Persistent cookies_, on the other hand side, are stored on the disk and can thus persist across browser sessions.
* _Scoped cookies:_ A `path` and `domain` attribute can be specified to limit the scope of the cookie to a specific domain, sub-domain, or path.

**Example:**

```
Cookie: key=value; expires=Sun, 24-Sep-2017 23:59:59 GMT; path=/; domain=.yoursite.com
```

# Sessions and cookies in Sinatra

When configuring a Sinatra app to `enable :sessions`, Sinatra will keep a `session` hash, where session information can be set and accessed as expected, e.g. `session[:blah] = "blubb"`, and `session[:blah]`. The session hash can be cleared by calling `session.clear`.

Rack will serialize the session hash, encrypt and sign it, and then send it along as a cookie, which will look like this:

```
Set-Cookie: rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRWI4OTdhMDJlNDBkMDFlNjcxNWUw%0AZGI1ZWU5MzQ0YTQyMjAzYjFiZTE2YzYxNzgwMWQxYjI3NzhiOWNhYTQ4YzUG%0AOwBGSSIJY3NyZgY7AEZJIiU2ZjdjN2Y0ZmM0MTdmMGJkNjBkNmY5MmQ1NDEx%0ANGQ4ZgY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi03NGNlNDIxYTczNjMwZDY3MWViNTlkYzIzN2YyN2M5NGU3ZWU4NTRm%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLTA3NjBhNDRjMzU0%0AODIxMzJjZjIyNDQyYTBkODhjMDhiYjg1NTYyNTAGOwBGSSIIZm9vBjsARkki%0ACGJhcgY7AFQ%3D%0A; path=/; HttpOnly
```

It will be signed with a session secret using HMAC-SHA1. If no session secret is set, Sinatra will generate a random 32-byte one each time the application is started (thus this is not preferable if there are multiple instance of the application running or session information should persist after a restart).  

In order to properly set a session secret:

1. Generate a random key, using the `sysrandom` gem.
```
$ ruby -e "require 'sysrandom/securerandom'; puts SecureRandom.hex(64)"
99ae8af...snip...ec0f262ac
```
2. Store this key in an environment variable, e.g. in a `.env` file from where it can be read by the `dotenv` gem:
```
SESSION_SECRET=0648388d8530539a5343fc62153d333a5178c7926dec16e16e1ee1adbe3d7ce4c3b7412afd80e1586802efdb68e4666f1ccde878bead09807705c3d7774cf457
```
3. In the configuration of the Sinatra app, pull the session secret from the environment.
```ruby
require 'sysrandom/securerandom'

configure do
  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
end
```
