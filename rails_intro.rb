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