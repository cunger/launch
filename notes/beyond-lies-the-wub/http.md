
# HTTP

The _Hypertext Transfer Protocol_ (HTTP) is a text-based application-level protocol. It regulates the communication between a _server_ (an application) and a _client_ (e.g. a browser). HTTP communication is based on a request/response cycle: The client sends a request, and the server responds to that request.

## Requests

Requests consist of:
* a request method (e.g. GET, POST)
* a path
* a protocol (e.g. HTTP/1.1)
* headers (key-value pairs of form `key: value`, meta data containing supplemental information about the client that sends the request or the resource it requests)
* a body

In HTTP/1.1, required are the request method, the path, as well as the `Host` header.

### Request methods

The method specifies the kind of request that is sent.

* **GET** requests are used for retrieving data, e.g. asking for the representation of a specified resource. They are restricted with respect to length and data type (ASCII character set).  
* **POST** requests are used for submitting data to the server (as part of the request body), and for initializing an action on the server, such as updating an existing resource or creating a new one. They are not restricted with respect to length and data type.
* **HEAD** only asks for the header of a response, e.g. for checking the response status code without actually transferring the resource, in order to check whether the resource exists or has been modified or moved. This can be relevant for caching purposes.  

A request is _safe_ if it does not request any action besides the retrieval of data. E.g. GET, HEAD. Not POST, PUT, DELETE.

A request is _idempotent_ if the result is the same no matter how often it is executed (aside from errors or expiration effects). E.g. GET, HEAD, DELETE. Not POST.

### Examples

```
GET /about HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
```

In case of a POST request sending data to the server, this data is sent as the request body:
```
POST /user HTTP/1.1
-------------------
Host: example.com
User-Agent: ...
-------------------
first_name=alice&action=update
```

## Responses

The server responds to the request, either by transferring the requested resource or information, or by indicating the result of an initialized action or the kind of problem that occurred.

* a protocol (e.g. HTTP/1.1)
* a status code
* headers (key-value pairs of form `key: value`, meta data containing information useful for the client, e.g. about the data being sent or the server)
* a body containing the raw response data (e.g. an HTML document or binary data of an image)

Required is the status, all other parts are optional.

Usually a browser issues several requests when pointed to a URL, e.g. requesting resources required to display an HTML page (images, stylesheets, scripts, etc) and following redirects.

### Example

```
HTTP/1.x 200 OK
---------------
Last-Modified: ...
---------------
<html>
...
</html>
```

```
HTTP/1.x 303 See other
---------------
Location: ...
---------------
```

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

`Moved` is used when the location of a requested resource was changed.

`See other` is mainly used for responses to POST requests, with the aim of directing the user to the resource that was created or updated by the request. In HTTP/1.1, the expected behavior is that the client sends a GET request to the new URL. (This was also the expected behavior for `302` in HTTP/1.0.)

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

## URLs

> A Uniform Resource Identifier (URI) is a compact string of characters for identifying an abstract or physical resource.
> -- https://www.ietf.org/rfc/rfc2396.txt

```
url = scheme "://" host [ ":" port ] [ path [ "#" anchor ] [ "?" query ]]
```

The `scheme` specifies a protocol, telling how the resource can be accessed, e.g. `http`, `https`, `ftp`, `mailto`, `git`.  

The `host` is either a hostname (e.g. `example.com`) or an IP address.

**Example:**
```
https://example.com:3000/character?first_name=elaine&last_name=marley
```

Default `port`s:
* `80` for HTTP
* `443` for HTTPS

The allowed characters in a URL are a subset of the ASCII character set. ASCII characters not in this set (_unsafe_, e.g. `%`) as well as reserved characters (`;`, `/`, `?`, `:`, `@`, `&`, `=`, `+`, `$`, `,`) need to be encoded as `%xx` where `xx` are two hexadecimal digits representing the ASCII code of the character (e.g. `%20` for space).

## HTTP communication

1. The **client**
* extracts the host name from the URL
* gets the IP address for that host name (using DNS)
* gets the port number (either specified in URL or default one)
2. The **client** opens a TCP/IP connection to the IP address with the port
3. The **client** sends an HTTP request to the **server**
4. The **server**
* processes the request
* accesses the required resources
* composes and sends an HTTP response
* usually also logs the transaction
5. The **client** receives the response and processes and displays the data accordingly
6. The client or server closes the connection

HTTP also allows for a chain of HTTP intermediaries between client and server (proxies, caches, etc).

## cURL

```
curl http://localhost:3000
```

```
curl -X GET "http://localhost:3000/books" -v -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:32.0) Gecko/20100101 Firefox/32.0"
```

`-A` for User-Agent
`-H` for headers

```
curl -X POST "http://localhost:3000/login" -d "username=guybrush" -d "password=APirateIWasMeantToBe" -v
```

`-d` results in the data being POST-ed as an `application/x-www-form-urlencoded` string.

## AJAX

_Asynchronous JavaScript and XML_ (AJAX) is used for displaying dynamic content, in particular issuing requests and processing responses without full page refreshes. When triggering a request, the response is handled by a callback (usually a client-side JS function), which then, e.g., updates the HTML page (by directly changing the DOM tree).    
