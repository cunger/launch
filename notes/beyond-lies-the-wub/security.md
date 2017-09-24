# Web application security

## HTTPS

Any request and response is plain text, thus vulnerable to being intercepted when sent across a network.

**Secure HTTP (HTTPS) = HTTP + TLS**

HTTPS encrypts each request and response using TLS (Transport Layer Security) (formerly using SSL) before sending them over the network. TLS uses symmetric cryptography, the keys being generated for each connection. Server and client negotiate the encryption algorithm and keys before transmitting any data, using public-key cryptography. Usually also at least the server is authenticated using public-key cryptography.


## Same-origin policy and CORS

Resources from the same origin can access each other without restrictions, where _same origin_ means same protocol, hostname and port. Therefore HTML pages can embed, e.g., scripts from the same origin.

Cross-origin resource sharing (CORS) has been developed to allow resources to also access resources from another origin. Servers can specify in an HTTP header the set of origins that are permitted to send cross-origin requests. In the simplest case, the request states its origin:
```
Origin: http://www.example.com
```
And the response specifies which origins are allowed:  
```
Access-Control-Allow-Origin: http://www.example.com
```
For completely public content (e.g. fonts on Google Fonts):
```
Access-Control-Allow-Origin: *
```

## Session hijacking

Obvious security problems with HTTP:

_Packet sniffing_: intercepting packets sent back and forth between client and server, when attached to the same network
_Session hijacking_: sniffing the session identifier, allowing someone to be logged in without knowing user name and password

**Countermeasures:**

* Use HTTPS for all network communication.
* Reset session IDs: All old session IDs expire (i.e. are no longer valid), both when a new session ID is created as result of a new log in, and after some specified timeout.  
* Requiring authentication when entering sensitive areas (e.g. before changing user account details or charging payments).

## Cross-site scripting (XSS)

Cross-site scripting refers to a client-side code injection attack. This is possible, for instance, when allowing free user input which is then parsed and delivered to other users.

**Example:** An HTML `<textarea>` for submitting a comment, and directly including that content into an HTML page. When submitting a comment with an injected script, e.g. `<script>...</script>`, it will be executed when the HTML page is parsed upon delivery to other users. This way, the web page unintentionally acts as an accomplice in an attack on its users.

In this way it is possible to access user-sensitive information such as cookies, register keystrokes and thus record sensitive information such as passwords, and modify the HTML of the current page, e.g. including a fake login form.  

**Countermeasures:**

* Never insert untrusted data (in HTML, JS, CSS, or other). Always either validate and filter the user input, so that no malicious code is executed, or encode it, e.g. by HTML escaping it, so that the browser interprets it as data, not as code.  
* Secure cookies: `Set-Cookie: blah=blubb; HttpOnly; secure`
  ** `HttpOnly` tells the browser that this cookie should only be accessed by the server (avoiding that it can be accessed by scripts).
  ** `secure` makes sure that cookies are sent only through HTTPS connections.
* Use the HTTP header `Content-Security-Policy`, which tells the browser to not load resources from untrusted sources, execute inline JavaScript, etc. (but still browser-specific).
