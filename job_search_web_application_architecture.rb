# Web Application Architecture

# Single Server Performance

# - WEBrick: single-threaded, ~100 req/sec
# - Puma: multi-threaded, ~2,000 req/sec
# - PostgreSQL
#     ~80k reads/sec on SSD
#     ~2.5k writes/sec on SSD
#     ~700 writes/sec on rotational RAID array

# Step 0: Scale Up
# - Increase the power of your machines
# - Add more CPUs, more cores, higher clockrate
# - Add more RAM
# - Swap rotational disks for SSD; use RAID.

# Step 1: Caching
# - Use CDN for minified/concatenated assets.
# - Use Cache-Control header to ask client to
# cache files.
# - Server-side, cache views, complex queries.
# - Common to use Redis, an in-memory
# key-value store, for this.
# - Keeping cached data fresh can be hard!

# Step 2: More App Servers
# - Add a load balancer to multiple app servers.
# - Use round-robin DNS to distribute queries to
# different load balancers.
# - Run many app servers on AWS.

# Step 3: Remove Async Work
# - For slow jobs like sending an email or
# processing data, don’t do this in the request
# cycle.
# - Put a message on a queue (like RabbitMQ),
# and have a background worker do this.
# - Issues
#     - Messages might be lost
#     - Idempotency of messages.

# Step 4: Scale Out Reads
# - Even with many app servers, DB is point of
# contention.
# - Run leader-follower replication. Writes hit
# leader, are streamed to followers.
# - Reads can hit any follower.
# - Works well for read-heavy loads.
# - StackOverflow uses 2 (very powerful) DB
# servers!

# Step 5: Handle LeaderFailover
# - Leader machine can crash.
# - Who becomes the new leader? Or are writes
# not processed?
# - This is an example of a CAP problem.
# - Want to solve this without manual
# intervention.
# - Common choice: use Zookeeper to elect a
# new leader.

# Step 6: Scale Out Write-Heavy Loads
# - Shard MySQL by placing keys onto different
# machines.
# - You have to do this manually; need to make
# your client code aware of this.
# - Probably prefer a distributed datastore like
# Cassandra at this point.
# - Major downside: loss of transactionality.

# Cassandra, HBase, MongoDB
# - Cassandra and HBase are very similar. Both
# are distributed maps of keys and values.
# - MongoDB is a document-oriented store; it has
# a richer query interface, since Mongo is aware
# of the format of the value.
# - In both, you must denormalize your data to
# avoid joins that would hit all shards.
# - Your DB schema reflects the types of queries
# you perform.