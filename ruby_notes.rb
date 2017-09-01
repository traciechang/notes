#my notes

# Falsey:
# - false
# - nil

# - destructuring

# git
# - a way to save your progress
# - commands:
# - git init #when you want to create repo
# - git status
# - git diff (see what you added)
# 	-> q to quite

# # 	git add
# 	-> then need to specify a file
# 	-'-A' -> means add every file that has not yet been committed

# #	git commit -m "this is my first commit"
# # git log
# # git commit --amend -m "your message here" #to change the message

# ##############
# ## try putting something in ruby_scratch.rb and save the file
# ## now type git diff if you want to see what you added
# ## git add -A
# ## git status
# ## git commit -m "add my first line"
# ## git log
# ## git push

# #############
# 1. on c9, created repository locally (like having a pic on your local machine)
# 2. now push local repository to remote (github) (like putting on dropbox and access available anywhere)
# 3. copy url and go back to c9 (need to tell it where to go)
# 	# git remote
# 	# git remote add origin [paste url]
# 	# git remote (now u should have origin)
# 	# git push
# 	-> could not push since we created a readme initially on github
# 	-> it wants u to update locally to what it looks like remotely first
# 	# git pull origin master

# * create on github first

# ##################
# git clone [url] (after you already create repo on git)

# 3 basic steps:
# add -A
# commit -m ""
# push

# 8/31/17
attr_accessor: 
- allows u to use attributes inside class w/out @
- allows other classes to modify it
- this, along w/ other such as reader, allows u to access attributes outside of the class

method_missing
- write method so that whatever method you call, it will do same thing
- Metaprogramming
	-> difficult to find and debug because method is not explicitly defined

pry
-if you want to test things in terminal one by one:
->gem 'pry'
->bundle install
->require 'pry'
->binding.pry
->pry
->load beer.rb

if you want to test only one line:
- ^: line # you want to run
