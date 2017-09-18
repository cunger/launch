
text-based, stateless request/response protocol

HTTP communication:
client sends request
server sends response

## Requests

POST requests are for
* initializing an action on the server, or
* sending data to the server.
They allow for sending data of greater length.

## Status codes

### 100s: Informational

### 200s: Successful

* `200` Ok
* `204` Success, no content

### 300s: Redirections

* `301` Moved permanently (future requests should use new URL)
* `302` Moved temporarily (future requests should use old URL)
* `303` See other

Redirects provide the new URL as HTTP header `Location`.

`Found`/`See other` is mainly for responses to POST requests, to direct the user to a resource (the newly created one or the one the state of which was changed). It thus expects the client to send a GET request to the new URL. This is the expected behavior for `303` in HTTP/1.1 and was the expected behavior for `302` in HTTP/1.0. Sinatra's `redirect` method thus sends a `303` if HTTP/1.1 and !GET, otherwise a `302`.

### 400s: Client error (problem with request)

* `400` Bad request (i.e. malformed)
* `401` Unauthorized (i.e. client needs to authenticate before having access to the resource)
* `403` Forbidden
* `404` Requested resource was not found
* `408` Request timeout
* `410` Gone (similar to `404`, but saying that the resource used to be there but was removed)

### 500s: Server error

* `500` Internal server error
* `501` Not implemented (e.g. if a particular HTTP method is not supported)
* `505` HTTP version not supported
