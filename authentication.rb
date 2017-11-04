Authentication 11/4/17

1. Secure State
Ex. You are buying on Amazon, and adding items to your cart. A URL to your cart could be: amazon.com/carts/412. This is not good because it exposes your cart ID

- we could give it a random string of numbers instead, like amazon.com/carts/823487239487 which would still point to cart 412. This is still bad becuase whoever has this link can get to your cart.

- What can we do to not expose the cart in URL but still connect to our user?
    - currently there is no way to do this w/ tools we have
    - HTTP is stateless: there is no way between different requests to the server that the server remembers who you are. Each request is independent.
    - We have a way to solve this: cookies

2. Cookies
- pieces (4kb) of data sent from website to browser. browser stores cookies, saved on client side
- cookies are implemented by giant hash map
- your browser enforces that only amazon can access amazon cookies
- each domain can only have 20? cookies
- if you don't have cookies enabled, you can't have state
- cookies are sent in header

- however, storing, for ex, cartID = 40, in your cookie is bad because client can go in and change the cartID in cookie and access someone else's cart.

- You (client) send username and pw to server. Server sends back session token (record that you logged in, it associates w/ your username and pw right now)
- Ex session_token = 382934839 (generated specially for u)
- Users table would include:
        - username
        - pw
        - session token
- everytime you log out, we delete session token out of the database
- this way, if soemone sees your old session token, it's been invalidated.