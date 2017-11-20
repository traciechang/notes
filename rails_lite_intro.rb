Rails Lite Intro 11/17/17

Things to keep in mind:
- try not to focus on spec passing without understanding what point is

What it is: web application framework: software framework for web apps
- for ex, if you're building your own bank app, you don't want to write boring repetitive work that is the same for every app. You want to make the stuff that is unique to your app. The framework does that for you.

What tools does it give to web dev?
- When HTTP request comes thru, Rails provides you:
    - default web server that receives this request (web brick)
    - it then goes into Rails Proper:
    - first hits Router (included module in Rails): it checks if anything matches in routes file (that you wrote)
    - instantiate new instance in Controller and send the action specified in Router, also give you params:
    3 sources of params:
    1. request body
    2. query string
    3. url 

    - Remember that your conotroller inherits from Action Controller. Your UserController will call UserModel, it will then hit databse, and return back bunch of User objects (ruby objects that are instances of User Model). User Controller then will render View.
    - Your Model inherits from Active Record Base
    - In the end, it will take the View and send back in the HTTP response
What will we need to do?
    - Router: needs functionality to load routes file and add the routes somehow
        - needds to be able to check if route created and see if any matches
        - instantiate instance of new Controller and send actions and give it params
    - Controller needs acces to Model and render Views