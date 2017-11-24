# TCP 11/17/17

# HTTP assumes reliable transport protocol - guarantees all info will be sent across internet and if broken up, will be sent in right order.

# War example - 2 generals send attack plan to each other, but must send their runners thru an enemy town. They break the message apart (segments) and general 1 will keep sending segments until he receives read receipts from general 2, and general 2 will resend read receipts to general 1 if they receive duplicate segment.
# - segments sent
# - read receipts sent back
# - enemy town resembles the Internet (complications can occur here, ie: traffic congestion, load balancing, etc.)