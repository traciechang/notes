# 9/9/2018

~ Priority Queue ~
Ex: Airline with the following group tiers: bronze, silver, gold, platinum
- if a gold member shows up after bronze, you can't have them board after bronze. You'd let them go before bronze and silver.

- in comp sci, this refers to what gets to be used by CPU by determining importance of those tasks

- How to represent this? We are going to use a data structure called a heap

~ Heaps ~
- a binary tree w/ some constraints
- Rules:
    - must be a complete tree
    - each node must obey the heap property: must be >= its parent
- a full tree means all parents have 2 children, except last row
- a complete tree is working towards a full tree, but does not have to be full. Just means there's no gaps between nodes
- priority queue and heap may be interchangeable terms
- 3 public methods:
    - peek: min/max
        - O(1) since it's always the head (the minimum)
    - insert: push
        - O(log n)
        - let's say we want to insert an int that is less than parent. To fix this, we just keep swapping w/ parent until parent is smaller than it
    - extract: pop
        - take minimum element and return it
        - this is a problem, since if we take the top most parent, we'd have to rearrange our entire tree. What we do is swap the top most node (min) with the last node, then remove the min from the bottom. Then we have issue of a large number at the top. We can fix this by keep swapping with the smallest child until it gets to bottom again
        - O(log n)

    - Implementation
        - using an array, going from top to bottom, left to right
        - ex: [2,3,2,11,4,7,4]
            - using indexes, we look at the parent and its children:
            parent 0 : children 1,2
            parent 1 : children 3,4
            parent 2 : children 5,6
            parent 3 : children 7,8
            parent 4 : children 9,10
            - we can see a pattern here and come up w/ formula on how to find children of parent:
            2i + 1, 2i + 2
            - what if we were given children, how to find parent?
            (i - 1) / 2
        - peek: the min element will always be the first spot in the array. get at index 0. O(1)
        - insert: we would insert at the end of array, then using formula, find its parent. Then we check if the parent is smaller than it, if not, we swap. we continue this until its parent is smaller than it
            - still O(log n)
        - extract: swap peek with last number, and pop off the peek. then again, find its children w/ formula, and swap w/ smallest child. keep swapping until it gets to correct spot

- Heap Sort
    - Naive approach: heapify - put ints from array into a heap one by one, then look at parent and see if it needs to swap. After this is done, keep extracting and putting into a new heap. Since the min will always get added until done, it will be sorted
        - O(n log n)
    - In Place:
        - use map heap, which means parent must be bigger than children
        - go from left to right, check if parent is greater, if not, swap
        - now we go from right to left. extract, move articial boundry to the left one, then heapify (with max). repeat until sorted
        - O(n log n)