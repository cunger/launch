
From the point of view of REST:

resources
(and addressability via URLs -- URLs identify resources)
(=> resource-based routes)

representations of resources and resource state
(when a client requests a resource via a GET request, the server sends back any machine-readable document containing any information about that resource - basically a representation of that resource and its state)
So HTTP, in a way, provides read access to the representation of resources, and write access to the resource's state. It's a protocol for supporting the interaction between agents and resources, more specifically it regulates the communication between clients (usually web browsers) and web servers.

Each URL identifies a resource. When a client sends a GET request to a URL, it receives a representation of that resource.
When a client sends a POST request, it sends either a new resource to create or the new state the client wants an existing resource to have.

(application state)

A *web server* processes HTTP requests and serves responses back to the client. It implements HTTP and related TCP connection handling (in collaboriation with the operating system, which provides hardware-close network support), and also manages its resources.

## TCP/IP

TCP/IP is a layered set of network protocols:

Application layer HTTP
(Security layer) TSL/SSL
Transport layer TCP
Network layer IP
Data link layer Network interfaces

TCP ... fault-tolerant.
TCP sends data in small chunks (IP packets) which contain:
* bytes of the actual data
* source and destination IP addresses
* information about size + numeric values used for data ordering and integrity checking

TCP connections are uniquely distinguished by four values:
* source IP + port
* destination IP + port
Such connnections involve network protocol handshaking to establish them, as well as segmentation and reassembly of data stream into and from IP packets.

Almost all HTTP communication on the web is carried over TCP/IP.

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

HTTP allows for a chains HTTP intermediaries between client and server (proxies, caches, etc).

### Statelessness

HTTP is a state-less protocol, in the sense that HTTP sessions last for one request: the clients sends a request, and the server sends a response. Client and server keep different states:
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
