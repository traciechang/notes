# Performance Optimizations Cheat Sheet

# Ways to Improve Performance

# -DB layer

# Index lookup columns (see lol_dba and rack-mini-profiler)
# Order indices to start from the most selective columns
# Denormalize the schema (only worth it for huge performance gains)
# [Use NoSQL for non-crucial data.]

# - Application layer

# Cache DB queries (see Russian Doll Caching)
# Use ActiveRecord counter cache
# Use a faster server (see Unicorn)
# Trade more space for less time in your code
# Cache rendered views
# Avoid N+1 queries
# Paginate long results
# Use background jobs for anything that doesn't have to be done immediately (e.g. for email)

# Use Adequate Record (Rails 4.2 only) to add extra caching
# Favor Model#pluck to avoid the overhead of creating Active Record models when you can avoid it
# In views, order records by primary key instead of created_at (it’s faster and almost equivalent)
# [Use a multithreaded server (see Puma)]
# [Add RAM to your server]
# [Upgrade Ruby version if you’re using an old one]
# [Flush the buffer right after </head>]
# [Use several servers and a load-balancer]

# - Network

# Server-side

# Load third-party assets through a CDN
# [Use a reverse proxy server like Varnish]
# Limit number of different hostnames but split components across hostnames
# Prefer GET to POST requests where it makes sense
Minimize cookie sizes
Preload components
Replace redirects with Alias and mod_rewrite
# Use servers that are close to your users
Uptime Robot (Heroku-specific)

Client-side

Keep components under 25k for iPhones so they can be cached
Enable asset caching with ETags, or remove ETags altogether
Configure cache-control Headers
Weed out predictable 404s from unavailable assets
Minify assets
Concatenate assets
Use CSS Sprites
Gzip components (see Rack::Deflater)

- Frontend

Assets

Avoid CSS-embedded JavaScript
Avoid redundant CSS rules
Don’t use inline CSS or JS if those assets are big enough to be cached
Tag scripts as async if you don’t care what order they’re executed in or if they’re from 3rd parties
Don’t use @import for CSS
Limit third-party JS libraries to what you need (e.g. jQuery.ui.sortable.js vs. jQuery.ui.all.js)

Markup

Put stylesheets at the top
Put scripts at the bottom (unless one does some writing to the body)
Limit the number of DOM elements (see document.getElementsByTagName(‘*’).length)

Images

Inline images
Limit image sizes to just the size and resolution needed on the page

JavaScript

Limit script interactions with the DOM
Replace JS logic with CSS transforms
Use vanilla JS for standardized DOM manipulations
Load more async data after main page is loaded
Cache array lengths inside for loops
Don’t modify class attributes on the fly

User Perception

Use loading animations
Use progressive JPEGs
Use isomorphic JavaScript to pre-generate initial DOM on the server-side (e.g., React, Meteor)

LRU Cache Implementation:
class Node
    def initialize(value)
        @value = value
        @nxt = nxt
    end

    attr_reader :value, :nxt
end

class LinkedList
    def initialize(head_value)
        @head = Node.new(head_value)
    end
end

list = LinkedList.new('A')
head = list.head

hash = {}
hash[head.value] = head

until head.next.nil?

end