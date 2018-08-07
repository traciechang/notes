# Frontend Authentication: Intro 1/18/18

# - Rails Authentication
#     - user table holds ID, email, password digest, session token

# - Main diff between rails auth and auth via API
#     - instead of rails backend serving html views, rails backend only will receive info in form of json from frontend & serving info back as json to frontend

# - heart of rails auth will stay same. Includes:
#     - user model
#     - user controller
#     - session controller
#     - application controller (ex. login, logout, current user helper, etc)

*****************************************

Frontend Auth: API Authentication

- starts when user sees form - fill in username, pw, submit button.
- package in json and sent to backend. POST to /users
    - will hit rails router
    - call Create in controller
    - controller will create new user w/ info passed in and attempt to save to db

*****************************************

Frontend Auth: Frontend Auth Pattern

- API Utils
    - user object needs to be sent to "/users" as a POST request

- storing current_user
    - how to store current_user in frontend? Store in state.
    state: {
        session: {
            currentUser: pusheen, (starts out as null. changes when user logs in)
            errors: "suername has already been taken, pw too short, etc"
        }
    }
    - ex: on welcome page, check if (current_user) { display user's name } else { <h2></h2> }

- restricting access
    - ex. you have homepage of all cats. you only let logged in user to create new cat. you can prevent a unlogged user from submitting a form, but it's better to just not let them access the create cat page in the first place. So when they try to go, u can redirect them to homepage or login page.
    - u can check is current_user, if no, redirect
    - code should go to a lifecylce method before component mounts

- boostrapping current_user
    - packinging HTML, JS, CSS, and current_user info and giving it as soon as app loads
    - prevent logged in user from ever seeing login page. takes them to homepage immediately
    - how to do this? in HTML, in script tag, set window.current_user = value of current user in rails backend
        

