# Quicksort (in place)

Base case: return if length <=1
Step 1: select pivot (first element)
Step 2: partition array around pivot
Step 3: recurse on left and right

input = [4,3,10,7,2,8,1]

 - imagine a barrier behind the pivot
 - look at idx 1, which is 3. It is less than our pivot, so barrier moves behind 3.
 - look at 10 and 7, both bigger than pivot so do nothing.
 - look at 2, it's less than 4, so u swap with the int right after the barrier (10), and move barrier behind the 2. currently looks like this: [4,3,2,7,10,8,1]
 - 8 is greater than pivot so do nothing
- 1 is less than pivot so swap with int right after barrier (7) and move barrier behind 1. now it looks like [4,3,2,1,10,8,7]

- now we want to get the pivot into place, which is the int directly to the left of the barrier (1). Swap them. So now [1,3,2,4,10,8,7]. Now the 4 is locked in place.
- now time to recurse. Call quicksort on array portion before pivot and after pivot. Repeat above steps.

- time complexity: nlog n (average case)
- by using a random pivot, u can make it log n