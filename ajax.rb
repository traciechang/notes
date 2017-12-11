# Ajax 12/7/17

# - backend's job is to receive a request and make a response
#     > rails: database, models, controllers

# - frontend: browser's job is to render html

Ajax: browser can make an http request without throwing away everything it already has. Server will respond w/ JSON instead of html
- asynchronous means that it is happening in the background

Ex: Instagram. When you keep scrolling, pictures keep popping up. You don't have to click button that says next 5 pictures. Javascript detects that you're at bottom of page and requests more.

Why? if we can reduce amount of times server needs to load things, we can reduce times

How does this work?
- 1st request we make to some page, we will still get HTML
It will have script src tag that will give JS code to load. JS will start running in the background. JS will make requests when you hit bottom of page.

$.ajax({}) #pass in options hash