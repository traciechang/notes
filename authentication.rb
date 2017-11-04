Authentication 11/4/17

1. Secure State
Ex. You are buying on Amazon, and adding items to your cart. A URL to your cart could be: amazon.com/carts/412. This is not good because it exposes your cart ID

- we could give it a random string of numbers instead, like amazon.com/carts/823487239487 which would still point to cart 412. This is still bad becuase whoever has this link can get to your cart.

- What can we do to not expose the cart in URL but still connect to our user?
    - currently there is no way to do this w/ tools we have
    - HTTP is stateless: there is no way between different requests to the server that the server remembers who you are. Each request is independent.
    - We have a way to solve this: cookies

2. Strategies

3. Cookies