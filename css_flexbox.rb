# CSS Flexbox 10/22/17

# - parent and child mindset
# - say header is parent element:

# <h1>
# <ul>
# <li>
# <li>
# <ul>
# <h1>

# - ul would be the only child of header, not li
# header {
#     display: flex;
# }

# to include li, you can do:
#     header, header ul {
#         display: flex;
#     }

# Ex:
# - check CSS tricks site to see what this means
# - it takes 100% of their container
# header {
#     flex: 1 100%;
# }