# CSS 9/18/17

# CSS: presentation layer
# HTML: structure

# avoid tags that have no meaning, such as <div> and <span>

# think of everything as boxes

# Chrome Developer Tools
# - let's you see what changes would look like before implementing it. You can just make the changes here and then copying it to your real file
# - you can also go through the page to go to the specific code. right click to Inspect
# - New style rule: shows you style sheets going into the page right now
# - Elements tab: where you'll be doing most of your editing
# - Sources: get your code here

# Syntax 9/19/17

# Selectors:
# BAD
# 1. !important - no way to write maintainable code
# 2. inline CSS
# 3. id - you can only have one ID on an HTML page, generally don't use for CSS

# GOOD
# 4. class '.favorite'
# 5. element '<p>'

# - your browser has built in style sheet
# - classes start with a period. Ex:
# .favorite {
#     color: red;
# }

# - specificity matters - if all is equal, last declared rule wins