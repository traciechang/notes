# 9/13/18

Binary Search Tree

- data structure to have O(logn) time for find, insert, and delete

- node can have 1 or 2 or no children

- everything on our left subtree of the root node has to be less than root node
- everything on right subtree has to be greater than root node
- each subtree should also be a binary search tree (u should think of keyword: recursion)
- if there is a node that equals the root node. To handle this, you need to establish where it would go and be consistent with it. You can put on left subtree, and it would become all nodes less than or equal to root node, or right subtree and all nodes greater than or equal to root node.

- find: first check to see if root node equals what ur trying to find, if not, and if its less than root node, u know to go to left side of tree. Check with root node of subtree, and so on
    - time complexity depends on depth of the tree. this is because we make a decision at each level (whether our number is equal to the root node and which side to go to). So O(depth)

- insert: same idea as find
    - time complexity: O(depth)

- delete: 
    - if what u want to delete happens to have no children, it's easy to delete
    - what happens if it's in middle of tree and has children? We need to replace it with something. Rules that the replacement must meet:
        1. It must follow the same rule as the node we're deleting. For ex, if the node we're deleting is greater than it's parent, the replacement must also be greater than parent
        2. Replacement must be greater than everything on the node we want to delete's left
        3. Replacement must be greater than everything on the node we want to delete's right

    - do satisfy rules, we pick the greatest node in the left subtree of the node we want to delete
        - to do this, go as right as possible on this subtree. 
    - if the replacement that we find has left subtree child, we simply move that subtree to its position
    - time complexity: O(depth)
    - this deletion method is call Hibbard Deletion

- A binary search tree is balanced if:
    1. difference in depth of left and right subtree is at most 1
    2. R and L subtrees are also balanced