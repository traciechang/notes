# Rack 11/17/17

# - middleware that exists between web server and web application
# - why can't they just communicate directly?
#     - Server recieves HTTP request, goes to Ruby which does some logic, sends back to server, and server sends out HTTP response

#     Ruby has many frameworks:
#     - rails, sinatra, camping, padrino

#     Also many servers:
#     - Webrick, puma, thin, unicorn

    - server's responsibility to parse string into something that ruby can use. every server does this differently
    - once framework does something w/ this, it returns back something to server, which could be different for every framework

    - middleware solves this problem (Rack): common interface on each side that has agreed upon set of rules