# CSS Inheritance 10/16/17

# - <article> <p> </p> <article>
# if p was specified to be blue color, and article was red, paragraph would be blue
# if there were two p's, and the later one was green, it would become green cuz it's the later one.
# now if you specify the second p to have the color "inherit", it will overwrite the first p (blue)
#  > it will check if it has a parent color and if there's a color set, and if so, it will take that color. in this case, it will become red
#  > basically, it looks for a parent container