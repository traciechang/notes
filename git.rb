# Git 9/11/17

# Version control

# Use git to:
# 1. keep track of changes
# 2. multiple people can work on project at once

#  - git commit is the version at a point in time

# Mental Models
# 1. Working Directory
# 	- imagine like typing ls in terminal: all files in current folder
# 	- git is going to keep track and know of any files you change
# 	- typing "git status" in terminal will show you what you modified
# 	- "git diff" will show you exactly what you changed
# 	- Now say you type "git add lib/game_folder/game.rb" and type "git status" again. It's now in changes to be committed, basically putting it in the Staging Area.
# 	- once in staging area, it means u want to save the changes in that file
# 2. Staging Area
# 	- you might want to review what you have here before committing so type "git diff --staged"
# 	- "git commit -m "changes that i made"
# 	- "git log" you can see your new commit
# 	- when you commit, you save a snapshot of your code and put it in a .git folder and your staging area is now clean
# 	- another way to look at it, is when you commit, you're making a new checkpoint (each time, you added something new):
# 	ex: initial commit -> add a switch player feature -> add computer player for game

# - "git branch" you can see each branch everyone is working on
# - " git checkout -b add_pusheen" (co = checkout, b = branch)
# - if you do "git branch" again, you can see you're on new branch
# - so now, go back and change something in your file. "git status" to see what you changed
# - "git add -A" to add all files
# - git commit -m "changed something"
# - "git branch" notice you are still on new branch you created
# - going back to our branch ex: initial commit -> add a switch player feature -> add computer player for game. Our new "add_pusheen" branch is now branching off of the
# add a switch player feature branch on master
# - now, we want to merge the changes we made on "add_pusheen" to master branch
# - "git checkout master"
# - "git merge add_pusheen" -> took all changes from pusheen branch to master branch
# - "git branch" you can see that you're back on master branch

# - go to git to create new repo, get url
# - on terminal "git remote add origin [url]" (you're basically writing "name the place on the internet that i want to put my code 'origin')
# - "git push -u origin master (push my master to origin)

# Bigger Picture
# - imagine everything we just did on our local repository (your computer)
# - when we run git run origin master, we copy the stuff on our local and put it on github. it will not have the pusheen branch, jsut the master. but you can push that branch too
# - you can have multiple remotes

# Going back to previous point in time
# - go to git log
# - copy hash (string of numbers and letters
# - "git co [hash]"
# - The HEAD is where we currently have, we just moved the HEAD to the point of the hash. It just let's you see your file in different snapshots in time.

# Useful commands in git

# "git reset --hard" -> resets your files to last commit
# say you changed two files and "git add -A", but only want 1 of those changes saved: "git reset lib/game_folder/game.rb". So now, if you commit, you won't see the one you don't want

# Summary
# - final draft where everyone works off of
# - branches are meant for small changes/experimentation
# - in real life, they don't expect you to know all commands. You're going to be googling most commands while you're working irl

# **********************************************************************************

# By I

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

#test