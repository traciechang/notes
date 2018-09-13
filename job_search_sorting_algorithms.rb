Bubble Sort
    - iterates thru array and swaps with element in front if necessary
    - time complexity: O(n**2)
    - space: O(1)
    - use case: minimal
    - stable
Insertion Sort
        - builds a sorted array as it goes
        - time complexity: O(n**2)
        - space: O(1)
        - stable
Selection Sort
        - finds smallest item in array and move it to very front, finds next and swap it into second place, and so on
        - time complexity: O(n**2)
        - space: O(1)
        - unstable(?). able to write it so its stable, but for most part its unstable

- The above work well on sufficiently small arrays

2. Merge Sort
        - breaking input into many different pieces recursively and merging back together
        - time complexity: O(nlogn)
            - this is true for worst case, best case, and average case
        - space: O(n)
        - stable
3. Heap Sort
        - turn input array into a heap. extract min or max, set it into appropriate place.
        - time complexity: O(nlogn)
        - space: O(1)
        - unstable
1. Quick Sort
        - depending on pivot, it can be really bad or good
        - time complexity: O(nlogn)
                - best case/average case
                - worst case: O(n**2)
        - space: O(logn)
                    - best/average
                    - worse is O(n)
        - unstable (in place version)
        - stable (naive version)

- Stable Sort: means it says sorted within a sort. 
Example: u first sort a list of names by last name. Then sort by first name. If there are same first names, they should still be sorted by last name