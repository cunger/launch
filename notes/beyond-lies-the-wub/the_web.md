
# REST

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

A *web server* processes HTTP requests and serves responses back to the client. It implements HTTP and related TCP connection handling (in collaboration with the operating system, which provides hardware-close network support), and also manages its resources.


# TCP/IP

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
Such connections involve network protocol handshaking to establish them, as well as segmentation and reassembly of data stream into and from IP packets.

Almost all HTTP communication on the web is carried over TCP/IP.
