# Starting a Rails Project 10/5/17

# - to start a new rails project in terminal:
# -> rails new Dogs  <- by default uses sqlite
# -> rails new Dogs -d postgresql

# - it will create a folder and fills in a bunch of files

# -> cd Cats

# - your gemfile helps keeps stable what gem versions you use throughout the project
# - if you ad gem 'pry-rails', you can use pry
# - you'll never have to update gemfile.lock by hand, it will update when you run bundle install

# Intro to the folders:
# - app:
#  > models: class which represents data from db
#  > view: template

# - config:
#  > database.yml : specifies which db we're connected to
#  > routes.rb : define http routes are available

# - db: pull our seeds file

# - lib: holds classes that we made

# - test: where we write our tests

# ******************************************************************
# Migrations

# **rake is from Rails 4, use rails now

# - paper trail, or record of how database got to current state

# terminal:
# -> rails generate migration CreateCatsTable

# - if you now go to db > migrate, you will see it

# - to run migration:
# -> rake db:migrate

# - if you run into database "something" does not exist, go to database.yml file
# -> rake db:create
# -> rake db:migrate
# - this should run and create your cats table
# - how do we see that it really created it? go to db/schema.rb to check
# - you won't see id, but it's added in

# -> rails g migration CreateToys
# - this should make a new migration called CreateToys
# - recommended that you put timestamps on every one you create

# -> rake db:migrate
# - what happens if you forgot to add a column after you run migrate?
# - if you try to add it and run migrate again, it won't do anything cuz it keeps track of what u already migrate
# -> rake db:rollback
# - it undo what we did, it deleted entire table. however, this will probably give u error if u did more than create a table
# - now u can add your column and migrate again.
# - if you had already pushed to github and production, you don't want to rollback (unless u are in development)
# - instead, make a new migration w/ ur corrected stuff.

# -> rails g migration AddColorToCats to change our cat table

# - migrations are meant to change the format of the table, not individual rows