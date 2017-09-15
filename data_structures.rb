# Data Structures 9/12/17

# example: arrays, hash, strings, class

# Abstract Data Type (ADT)
# - Example: set - collection of objects so that each object exist or doesn't exist. in other words, no duplicates
# 	should be able to include?, <<, delete
# - [3, 2] As long as no duplicates, you can say that this array implements a set. It satisfies what is a set (an ADT)
# - You can also do a hash -> it can include?, <<, and delete. This hash also implements a set
# - when you insert something that's already in a set, nothing happens

# - Another ADT example is a Map / Dictionary
# - only 3 methods need to do are:
# 	set(key, val)
# 	get(key)
# 	delete(key)
# - a map is simply a key-value pair
# - most common way to implement a map is a hash
# - another way is an array -> [["hello", "world],[2,4]]. Although not a very good way because slow
# - remember a map can only have unique keys

# - An ADT doesn't demand you use a particular data structure, but demands that you satisfy its requirements
# - given an algorithm, you may need to use a particular ADT

# - ADT example: Stack
# - to visualize, think of cafeteria trays. lunch lady will continuously stack or "push" clean trays and people will continuously take or "pop" trays
# - things on top are the newest (Last In, First Out)
# - Stack supports 2 operations: push, pop
# - if you only call these two operations on an array, then the array implements a stack
# - stack is almost always implemented by an array
# - remember in that anything that can be written recursively can be written iteravely. How? Instead of using the implicity stack w/ recurssion, you make your own stack in iteration
# - this is because the algorithm REQUIRES a stack
# - remember that a stack is implicit in any recursive algorithm

# - ADT example: Queue (opposite of stack)
# - imagine line at grocery store. first person gets served first. When first person is served, they are dequeuing, or "shift" (taken off the queue)
# - when person enters back of line, they are enqueuing, or "push" (First In, First Out)
# - push <-----> shift
# - unshift <-----> pop
# - usually implemented w/ arrays

# - ADT example: Tree
# - most common tree is binary tree
# - each circle is called a node/vertex. it is called binary tree because each node has at most 2 children
# - a child has at most, 1 parent. (A ternary tree would have at most 3 children, unary tree would have at most 1 child)
# - a tree that gives no guarantee for number of children is called n-ary tree or polytree
# - node at top is root. Subtree's top tree is the root. Bottom nodes are called leaves
# - nodes directly on top of nodes is parent and bottom ones are child. the row below the child is the grandchildren
# - Depth or Height of Tree: 3 in this example, because no path from root to leaf that involves more than 3 nodes (deepest to leaf node)
# A
# BC
# DEFG
# - tree traversal: figuring out ways you can iterate thru a tree. There is no "best" tree traversal, there are just different ones

