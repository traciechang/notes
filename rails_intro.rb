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

# ******************************************************************
# Models 10/16/17

# - using rails to interact w/ content of our tables. It will give us object oriented way to interact

# - In text editor, right click models folder and click New File and give it the singular version of your table (ex. cat.rb)
# - name of class and name of file should be same

# class Cat < ActiveRecord::Base
# end

# - to open rails console, go to terminal and type:
# rails console -or- 
# rails c

# - you can create an instance locally (c = Cat.new) and set things we've defined (c.name = "sarah")
# -> c.save | this will insert your instance into database
# -> sarah = Cat.first | this gets the first row from the db and assigns those data to sarah

# -> jeff = Cat.new(name: "Jeff", color: "green") | you can also pass in an options hash 
# -> jeff.save
# -> Cat.all | to see all your cats
# -> Cat.last | to see last cat in db
# -> jeff.destroy |removes jeff from db

# -> Cat.find(1) | finds the cat with id # 1
# -> Cat.find_by(name: "sarah") to find by something other than id

# -> Cat.create(name: "Jeff", color: "orange") | this create an instance AND save to db

# ******************************************************************
# Basic Associations (belongs to, has many)

# - macros:
# class Cat < ActiveRecord::Base
# 	belongs_to :house, #the name of the method you want as the instance method
# 		primary_key: :id, #the primary key of the other table (house)
# 		foreign_key: :house_id, #the name of column of this table that points to primary key of other table
# 		class_name: 'House'
	
# end

# -> jeff = Cat.last
# -> jeff.house #should give you Jeff's house now

# class House < ActiveRecord::Base
# 	def cats
# 		Cat.where(house_id: self.id)
# 	end
# end

# - the equivalent to the above is:
# class House < ActiveRecord::Base
# 	has_many :cats,
# 		primary_key: id,
# 		foreign_key: :house_id,
# 		class_name: 'Cat'
# end

# -> beach = House.last
# -> beach.cats #return all cats living in this hosue

# -> beach.cats = Cats.all #this actually updated all cats to this beach house
# this means that the method cats that we defined is also a setter method, that it also did these things:
# def cats
# 	#...
# end

# def cats=(arg)
# 	#...
# end

# r = House.first
# r.cats # should be empty now that we placed all cats into beach house
# r.cats << Cat.first #shovels first cat into r.cats. It changed the house of the first cat to r
