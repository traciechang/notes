# CSS Float & Clearfix 10/19/2017

# - the purpose to clear it is so that it won't stick thru the parent container.

# .pseudo-stop-float:after {
# 	content: "STOP THE FLOAT";
# 	background: green;
# 	display: block;
# 	clear both;
# }


# Example:
# *memorize this clearfix:

# .clearfix:after {
# 	content: ""
# 	display: block;
# 	clear: both;
# }

# - you need the content, even if you have to make it empty with "". It will not work without a content.
# - include the block because only block content can clear floats

# ********************************************************************
# CSS Grid System

# - when you specify pixel sizes, it will stay that size so if you are viewing, say, on an iphone, it may look too big and the user would have to 
# scroll to the right to see the whole thing. How can we fix this? by using percentages
# - but for stuff like padding, would you have to calculate the percentage as well? You could, but you can also use box-sizing.
# - by using this, the content is including the padding width inside its calculation

# Example:

# aside {
# 	width: 33%;
# 	float: left;
# 	padding: 10px;
# 	box-sizing: border-box;
# }