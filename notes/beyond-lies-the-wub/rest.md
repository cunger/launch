
REST (_Representational State Transfer_) is a set of conventions to expose URL endpoints that allow you to perform operations on resources that correlate with CRUD actions.

When a client requests a resource via a GET request, the server sends back any machine-readable document containing any information about that resource - basically a representation of that resource and its state. So HTTP, in a way, provides read access to the representation of resources, and write access to the resource's state.

Client and server keep different states:

* Client: application state
* Server: resource state

And they neither know about nor have direct control over the other's state.

A *web server* processes HTTP requests and serves responses back to the client. It implements HTTP and related TCP connection handling (in collaboration with the operating system, which provides hardware-close network support), and also manages its resources.

Usually, a *web server* is a server responding to static assets (files, images, scripts, etc.) that don't require any data processing, while an *application server* hosts the application logic, handling complex requests for running server-side code, often consulting a persistent _data store_.

Server-side code is run on the server before a page is served (e.g. running a template engine to render an HTML page).
Client-side code is run on the client after a page is loaded (e.g. JavaScript updating the HTML page after it was loaded).
The boundary is usually drawn upon considerations such as processing load and security (hiding all application logic vs exposing it to the client).
