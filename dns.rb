DNS 11/17/17

Domain Name Service
ex: www.google.com

IP address 192.168.1.1
This is what computer can actually read.
- google.com is just for humans to easily remember and type

- how does browser turn google.com into IP address?
    - browser asks operating system if you've been there before
    - operating system keeps track of everything you've been to.
    - if haven't been, browser makes DNS query
    - ISP (internet service provider)
    - Ex: you make DNS query to ISP. It has DNS Resolver, which makes series of queries to different servers to find out where this IP address is
        - looks at top level domain (.com)
        - makes query to root name servers, and it will tell u where .com is
        - Resolver then goes to top level domain where .com is and tries to find where google.com is. it tells it where to find google.com server
        - then go to google.com server, where it knows IP address
        - IP address goes back to your computer
    - this situation is worst case situaton

- caching
    - DNS Resolver, as well as all the servers previously named, keeps a cache
    - DNS Resolver most likely cahced google.com
    - or, DNS Resolver may already know where google.com name server is, and skip a couple steps