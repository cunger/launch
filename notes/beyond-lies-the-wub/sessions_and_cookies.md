## Sessions

> set a cookie that persists an identifier across multiple HTTP requests, and then relate these requests to each other

cookies: plain text, key-value pairs, max 4KB

response:
```
Set-Cookie: id=23
```

every subsequent request:
```
Cookie: id=23
```

in Sinatra: `session[:blah] = "blubb"`
Sinatra keeps a `session` hash, which Rack will serialize, encrypt and sign, to send along as a cookie:
```
Set-Cookie: rack.session=BAh7CUkiD3Nlc3Npb25faWQGOgZFVEkiRWI4OTdhMDJlNDBkMDFlNjcxNWUw%0AZGI1ZWU5MzQ0YTQyMjAzYjFiZTE2YzYxNzgwMWQxYjI3NzhiOWNhYTQ4YzUG%0AOwBGSSIJY3NyZgY7AEZJIiU2ZjdjN2Y0ZmM0MTdmMGJkNjBkNmY5MmQ1NDEx%0ANGQ4ZgY7AEZJIg10cmFja2luZwY7AEZ7B0kiFEhUVFBfVVNFUl9BR0VOVAY7%0AAFRJIi03NGNlNDIxYTczNjMwZDY3MWViNTlkYzIzN2YyN2M5NGU3ZWU4NTRm%0ABjsARkkiGUhUVFBfQUNDRVBUX0xBTkdVQUdFBjsAVEkiLTA3NjBhNDRjMzU0%0AODIxMzJjZjIyNDQyYTBkODhjMDhiYjg1NTYyNTAGOwBGSSIIZm9vBjsARkki%0ACGJhcgY7AFQ%3D%0A; path=/; HttpOnly
```

> The session secret is a key used for signing and/or encrypting cookies.
> Cookies are the most common way for web applications to persist state (like the currently logged in user) across distinct HTTP requests.
-- https://martinfowler.com/articles/session-secret.html

From http://rubylearning.com/blog/2009/09/30/cookie-based-sessions-in-sinatra/ :

A set of defined properties is inherent to the cookie structure. Those properties include an expiration date, a path and a domain. The first attribute requires a date defined in Wdy, DD-Mon-YYYY HH:MM:SS GMT format. The rest of the cookie characteristics require a path and/or a domain defined as a string. Let’s take a look at this example:

Cookie: key0=value0; ...; keyX=valueX; expires=Wed, 23-Sep-2009 23:59:59 GMT; path=/; domain=.yoursite.com
When the expiration date is defined, your cookie will be “persistent” as it will reoccur in different sessions until the set expiration date has been reached. If the expiration date has not been defined in the cookie, it will occur until the end of your current session or when you close your web browser. If the path and/or the domain attributes have been defined in your cookie, then the web server limits the scope of the cookie to that specific domain, sub-domain or path.


1. Generate random 160bit key for SHA-1: `head -c20 /dev/urandom | base64`
2. Pull it from an environment variable: `set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(20) }`
   (and if it's missing, generate it)
3. Specify the environment variable when starting the app, e.g. `SESSION_SECRET=’Xe005osOAE8ZRMDReizQJjlLrrs=’ ruby sinatra-app.rb -p 8080`
