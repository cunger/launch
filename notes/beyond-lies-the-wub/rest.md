
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

Client and server keep different states:
* Client: application state
* Server: resource state
And they neither know about nor have direct control over the other's state.

A *web server* processes HTTP requests and serves responses back to the client. It implements HTTP and related TCP connection handling (in collaboration with the operating system, which provides hardware-close network support), and also manages its resources.

Usually, a *web server* is a server responding to static assets (files, images, scripts, etc.) that don't require any data processing, while an *application server* hosts the application logic, handling complex requests for running server-side code, often consulting a persistent _data store_.

Server-side code is run on the server before a page is served (e.g. running a template engine to render an HTML page).
Client-side code is run on the client after a page is loaded (e.g. JavaScript updating the HTML page after it was loaded).
The boundary is usually drawn upon considerations such as processing load and security (hiding all application logic vs exposing it to the client).
