# CSS Reset 10/16/17

# - your browser has built in style sheets
# - two schools of thought: 1) I should design everything, 2) Built off of defaults

# - to reset defaults, do your own:
#     - go thru and list out all the tags you have
#     <style>
    
#         html, body, section, article, h1, h2, p {
#             # don't really want to put values in this section
#             # may want to include some other things in here, like box sizing. but these are pretty default ones u should memorize

#             margin: 0;
#             border: 0;
#             padding: 0;
    
#             font: inherit; #these are inheriting from body
#             text-align: inherit;
#             text-decoration: inherit;
#             color: inherit;
#             font-family: sans-serif; # why is this a bad idea? if you had <article><h2><p> <p><h2><article>, and you specified another font for article, it will still be sans serif inside for h2 and p
    
#             background: transparent;
#         }
    
#         body {
#             padding: 20px;
#             border: 10px;
    
#             font-family: sans-serif;
#             font-weight: bold;
#             color: red;
#             }
#     <style>