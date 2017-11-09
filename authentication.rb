# Authentication 11/4/17

# 1. Secure State
# Ex. You are buying on Amazon, and adding items to your cart. A URL to your cart could be: amazon.com/carts/412. This is not good because it exposes your cart ID

# - we could give it a random string of numbers instead, like amazon.com/carts/823487239487 which would still point to cart 412. This is still bad becuase whoever has this link can get to your cart.

# - What can we do to not expose the cart in URL but still connect to our user?
#     - currently there is no way to do this w/ tools we have
#     - HTTP is stateless: there is no way between different requests to the server that the server remembers who you are. Each request is independent.
#     - We have a way to solve this: cookies

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

3. Encoding / Encryption
- don't want to store pw in database in plain text

- Encoding: you can figure out the original string (able to decode if you can figure out how it was encoded)
- base64 encoding: encoded using ASCII
        26 a-z
        26 A-Z
        10 0-9
        1 -
        1 + (or any other symbols)
        total = 64^10 (if your original string was 10 chars)

- Encryption
        - Ex: caesar cipher ("abbc", 2) => "cdde"
        - This is encrypted because you cannot figure out original string w/ just the encrypted. In this case, it depends on the shift number (2). It could have been 1, in which the original string was "bccd". 
        - you need a Secret Key (2 in this case). If you don't have it, you cannot crack the code.

- Now, let's say we encrypt the pw in the db. But we need the secret key to decode it. In turn, we'd have to store that key somewhere, therefore, encryption is not a viable option.

4. Hashing
Review: you can put anything into a hashing function and get an arbitrary number. It is one way. If you put in "hello" and get the output 2348947359384, there's no way to get "hello" back from this number. 
- Everytime you put in "hello", you get same number

- We can put a pw hash into our Users table. Put the pw into the hash function to get our pw hash
- To check if pw is correct, we'd hash the pw the user entered and see if it matches the hash stored in our db

- Hash Collision: when two arbitrary values put into hash function come out with same hash output

- Cryptographic Hashing Functions
        - more Secure
        - minimize rate of collision (extremely low)
        - Ex. SHA-1, MD5, SHA-2, Scrypt, Bcrypt (Blowfish)*
        - you want to use state-of-the-art hashing functions at the time. As hashing fuctions get old, people figure out how to break it

5. Salting
- Rainbow tables: precomputed tables with most common passwords. Hackers hash most common pws with hashing functions such as SHA, MD5, and blowfish, create a table of this, and if they get your Users table, they can just match the hashes to figure out pw
- how to solve this? Salting

- Salting: a short string that is appended or prepended to the pw and you hash that whole thing
- salt is generated anew for each user
- Users table stores hash output AND salt

- there is one more problem: what if hacker picks just one account that he wants to hack into?
Ex: billgates12

Solution: (last line of defense)
- make it so expensive to crack the pw that hacker does not even think its worth it to try to crack it
- run billgates12 plus the salt thru the hash function 40 times. Althought this may slow you down too (say, 100ms), cracker has to run this 10,000 times (for 10,000 most common pw) and slow him down significantly, also increasing his cost to crack the pw
- Increase number of times you run input into hash function

6. Session, Flash
- The 2 APIs you can use in Rails

- Session: used in Control layer. A hash.
Ex. session[:session_token] = "had933"

- Flash
        - a permanent cookie expires in 20 yrs
        - what if you don't want a permanent cookie?
    Ex: you send a POST request to create a new cat, but it was invalid. You don't just want to redirect the user back to the Add New Cat page, you want to tell them what errors too. But HTTP is stateless, so use temporary cookie w/ the error info
    - cookie lives for one request
    - you see this when red letters appear under username box and says "username can't be blank"
    - lives for this request and the next

    flash.now[:user_error]: this only exists for one request, not even goes to user
    - not a cookie, not persistent

7. Auth Pattern
- never roll your own authentication
Ex: User model
        - validates password (makes sure the user enters a pw)
        - checks that pw is certin length
        - allow_nil: true <- this part of the validation allows you to pull out of database when nil
        - self.password_digest = Bcrypt...
        - might include methods such as generate_session_token, ensure_session_token, reset_sesssion_token
        - class method: find_by_credentials(username, pw)

    Users Controller
        new <- register
        create <-create new user/login

    Session Controller
        new <-login form
        create <- logs u in
        destroy <- log out

    Application Controller
        @current_user ||= <-so u don't have to keep finding the user
        login!(user)
        session[:session_token]=
        redirect_unless_logged_in

****************************************************
CSRF attack (Cross Site Request Forgery)
Ex: you click a button WIN A CAT and have no idea that it is posting to another website. It's using a bad site to do somethig to your good site
- only works when you're logged in to good site
- how to prevent this attack? you would use the "protect from forgery", but we are going to build one today

- sandboxed: fb can't see your twitter cookies. Twitter can't see your fb cookies.

Rails own: protect_from_forgery:
- whitelists GET requests
- checkes to see if already a token, if not, get one
- the "with exception" part tells it to raise exception if something wrong