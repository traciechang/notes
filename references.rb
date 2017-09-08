# References 9/7/17

# reference, or pointer
# x = 4 -> point x to 4
# x = 5 -> change pointer to 5

# Example:
# x = 4
# y = x
# x = 10
# p y -> what would y be?
# in y = x, we actually point to what x was pointing to, so 4
# we then changed x to point to 10. Therefore, y is still pointing to 4.

# Example:
# x = 4
# y = x
# x += 2 -> the equal sign will create new pointer, therefore, x will point to 6

# what is y? y is unchanged, so 4.
# what can we do to make y equal what x equals? nothing.
# this is because fixnums are immutable (can't mutate) objects.
# We didn't change what was stored in memory (the 4 and 6), we just made the name point to a different thing.

# Then what are some mutable (can be mutated) objects?
# - arrays
# - strings

# Example:
# x = "Dona" -> store "Dona" in memory and make x point to it
# y = x
# x << "the turtle" -> this is mutating the original data stored in that cell
# what would y be? y would now be "Dona the turtle" because we actually mutated the cell

# Example:
# x = "Dona"
# y = x ->assign y to same place in memory as you did x
# x += "the turtle" -> the assignment operator = is not going to change what's in the original cell with "Dona".
# It's going to take the original string, add the new string, and create a new place in memory for it, erase original pointer for x,
# and point x to it. This did not mutate original cell, just make a copy of it.
# what is y? so y is still pointing to original "Dona"

# Example:
# x = [] 
# y = x
# x << "hello"
# what is y? y would also equal ["hello"]

# Ex.
# x = Array.new(3,[]) -> [[],[],[]]
# x[0] << "hello" -> you would expect this to be [["hello"],[],[]]
# however, it is actually [["hello"],["hello"],["hello"]] because the [] that you specified in x = Array.new(3,[]) is actually putting the same array 3 times.

# How can we create an array with 3 different arrays then? x = Array.new(3) {[]}
# Now, x[0] << "hello" will be [["hello"],[],[]]