# 8/20/18 System Design

# https://www.youtube.com/watch?v=UzLMhqg3_Wc

# Ask good questions:
# - what features to work on
# - how much to scale

# Don't use buzzwords in the interview (make sure that what you talk about, you actually have in depth knowledge of it)

# Clear and organized thinking - make sure u understand from high level first

# Drive discussions - make sure u lead the discussion (80 - 20 rule). You talk 80% of the time and interviewer talks 20%.

# Practice - given a problem, talk to a friend about how u would approach solving it.

# Parts to System Design Interview:
# - Features
#     Ex: if asked to design a FB chat, features include a one to one messaging system, and letting other party see once message is read
# - Define APIs
# - Availability
#     ex: if host or data center went down
# - Latency Performance
#     Ex: if customer facing, must be fast
# - Scalability
#     Ex: u design a system and it works for 100 users, but will it work for 1000 users?
# - Durability
#     Data can be stored in db securely, and it won't be compromised
# - Class Diagram
#     - how would u design a class
# - Security and Privacy
# - Cost effective

# Topics:
# - Vertical vs horizontal scaling
#     - if u need to scale ur system, u can do vertical (add more memory, cpu to existing host) or horizontal (add another host). Horizontal preferred.
# - CAP theorem
#         - Consistency (read has most recent write), Availability (ull get response back), Partial tolerance
#         - u can only have 2 of these 3 things
# - ACID vs BASE
#         - ACID: used in relational db
#         - BASE: used in NoSQL db
# - Partitioning/Sharding 
#     - Consistent Hashing
# - Optimistic vs pessimistic locking
# - Strong vs eventual consistency
#         - Strong: reads will always see latest write. Used in relational db
# - RelationalDB vs NoSQL
# - Types of NoSQL
#      Key value
#      Wide column
#      Document-based
#      Graph-based
# - Caching
#     - used to speed up ur request
#     - cannot be the source of truth
#     - must be small
# - Data center/racks/hosts
#     - data centers have racks and racks have hosts
# - CPU/memory/Hard drives/Network bandwidth
# - Random vs sequential read/writes to disk
#     - random are slower than sequential
# - HTTP vs http2 vs WebSocket
#     - http2 can do multiple request or single connection
#     - WebSocket bidirectional communication between client and server
# - TCP/IP model
#     - good to know what each layer does
# - ipv4 vs ipv6
#     - 4 has 32 bit address, 6 has 128 bit address. We are running out of ipv4 addresses
# - TCP vs UDP
#     -tcp is reliable connection, udp unreliable (ex: streaming vid)
# - DNS lookup
#     - if u type www.google.com to browser, translates this address to an IP address
# - Http & TLS
#     - transport layer security
# - Public key infrastructure and certificate authority(CA)
#     - CA is trusted and tells u if public key is definitely coming from say facebook, and not a 3rd party that hacked fb
# - Symmetric vs asymmetric encryption
# - Load Balancer
#     -> L4 vs L7
# - CDNs & Edges
#     - content delivery network (ex: netflix put in CDN close to u, which helps w/ Performance. vs putting it just where they are located.)
# - Bloom filters and Count-Min sketch
# - Paxos 
    - consensus over distributed hosts
    - Leader election
# - Design patterns and Object-oriented design
# - Virtual machines and containers
- Pub-sub architecture over queue
- MapReduce
- Multithreading, locks, synchronization, CAS(compare and set)

