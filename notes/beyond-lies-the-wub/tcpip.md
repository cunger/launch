
Protocols define a language and a set of rules and procedures that enable devices and systems to communicate with each other.

The OSI Reference Model and TCP/IP are two conceptual models for network communication. Both are layered sets of protocols, and the network protocols found in TCP/IP are also contained in OSI.

# TCP/IP

Layer | Protocol
----- | --------
Application layer | HTTP
Security layer | TSL
Transport layer | TCP
Network layer | IP
Data link layer | Network interfaces

TCP sends data in small chunks (IP packets) which contain:
* bytes of the actual data
* source and destination IP addresses
* information about size + numeric values used for data ordering and integrity checking
This makes it fault-tolerant.

TCP connections are uniquely distinguished by four values:
* source IP + port
* destination IP + port
Such connections involve network protocol handshaking to establish them, as well as segmentation and reassembly of data stream into and from IP packets.

Almost all HTTP communication on the web is carried over TCP/IP.  
