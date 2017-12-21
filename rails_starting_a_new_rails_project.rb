Start new rails project 10/25/17 by I
> Gem install rails
> rails new youtube

> rails g controller users
- Controllers naming convention is plural
- Ex. Maybe there’s a page u want to see all users for youtube
- need to create routes

RESTful API design - if I am building app and want to list all users for this app, I’m going to go to users resource and if I don’t declare anything after users, I’m going to get all the users back

GET
# youtube.com/users
# all users
# youtube.com/users/123
# Gets user w/ id 123

# DELETE
# youtube.com/users/123
# delete this user

# POST
# youtube.com/users
# this should allow u to create a new user

# PATCH
# youtube.com/users/123
# for editing/updating

Routes.rb
- If someone navigates to this page, I want this controller to to handle this
- - by declaring resources :users, by default it gives you index, new, create, show, edit, update, destroy, etc.
- All these routes are done for us. But our controller doesn’t know how to handle these actions

users_controller.rb
- Def index
- End

Rails is going to look for a view 

Go to Views folder, make a users folder > create index.html.erb file