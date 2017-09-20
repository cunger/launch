
# HTTP

The _Hypertext Transfer Protocol_ (HTTP) is a text-based application-level protocol. It regulates the communication between a _server_ (an application) and a _client_ (e.g. a browser). HTTP communication is based on a request/response cycle: The client sends a request and the server responds to that request.

Requests and responses consist of a header and a (possibly empty) body.

## Requests

* method (e.g. GET, POST)
* path
* protocol
* headers
* body

### Methods

* **GET** requests are used for retrieving data, e.g. asking for the representation of a specified resource. They are restricted with respect to length and allowed data type (ASCII characters).  
* **POST** requests are used for submitting data to the server (as part of the request body), and for initializing an action on the server, such as updating an existing resource or creating a new one. They are not restricted with respect to length and data type.

* **HEAD** only asks for the header of a response, e.g. for checking the response status code without actually transferring the resource, in order to check whether the resource exists or has been modified or moved. This can be relevant for caching purposes.  

### Examples

```
GET /about HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
```

```
POST /user HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
first_name = alice & action = update
```

## Responses

The server responds to the request, either by transferring the requested resource or information, or by indicating the result of an initialized action or the kind of problem that occurred.

Usually a browser issues several requests when pointed to a URL, requesting resources required to display an HTML page (images, stylesheets, scripts, etc) and following redirects. 

### Status codes

#### 100s: Informational

#### 200s: Successful

* `200` Ok
* `204` Success, no content

#### 300s: Redirections

* `301` Moved permanently (future requests should use new URL)
* `302` Moved temporarily (future requests should use old URL)
* `303` See other

Redirects provide the new URL as HTTP header `Location`.

`Found`/`See other` is mainly for responses to POST requests, to direct the user to a resource (the newly created one or the one the state of which was changed). It thus expects the client to send a GET request to the new URL. This is the expected behavior for `303` in HTTP/1.1 and was the expected behavior for `302` in HTTP/1.0. Sinatra's `redirect` method thus sends a `303` if HTTP/1.1 and !GET, otherwise a `302`.

#### 400s: Client error (problem with request)

* `400` Bad request (i.e. malformed)
* `401` Unauthorized (i.e. client needs to authenticate before having access to the resource)
* `403` Forbidden
* `404` Requested resource was not found
* `408` Request timeout
* `410` Gone (similar to `404`, but saying that the resource used to be there but was removed)

#### 500s: Server error

* `500` Internal server error
* `501` Not implemented (e.g. if a particular HTTP method is not supported)
* `505` HTTP version not supported


## HTTP communication

1. Client
* extracts the host name from the URL
* gets IP address for that host name (DNS)
* gets port number (either specified in URL or default one)
2. Client opens a TCP/IP connection to IP with port
3. Client sends an HTTP request to the server
4. Server
* processes the request
* accesses required resources
* composes and sends HTTP response
* logs transaction
5. Client receives the response and displays the data/resource accordingly
6. Client or server closes the connection

HTTP also allows for a chain of HTTP intermediaries between client and server (proxies, caches, etc).

## Statelessness

HTTP is a state-less protocol in the sense that HTTP sessions last for one request: the clients sends a request, and the server sends a response. Client and server keep different states:
* Client: application state
* Server: resource state
And they neither know about nor have direct control over the other's state.

In order to create a stateful experience, servers usually generate and store session data, passing a session identifier between client and server as a cookie.

### HTTP State Management Mechanism (aka Cookies)

Best current way to enable persistent sessions (and especially identify users).

* Session cookies: temporary and deleted when the client application (e.g. browser) is closed
* Persistent cookies: stored on disk  
Session cookies are those that have the `Discard` parameter set or don't have an `Expires`/`Max-Age` parameter that indicates an extended life time.

Cookies are pieces of state, more specifically _client-side_ state, as the client is responsible for storing cookie information.
The state is described in name/value pairs `name=value`, separated by `;`. It is sent with the response to the client, which stores it, and sends it to the server with each request it makes:
* HTTP response header: `set-cookie: ...`
* HTTP request header: `cookie: ...`
