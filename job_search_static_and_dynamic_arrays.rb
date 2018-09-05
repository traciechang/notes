# ~ Static Arrays

# Ruby's array class is built on top of a simpler data structure
# Static Array
#  - get method
#  - set method
#  - no push, pop, shift, etc. WHy? We cannot resize static array. We initialize static array with a length
- when u initialize a static array, u dont know initially what is in each spot
- when u initialize a static array, u tell the system to allott how many contiguous cells. It sends us back the address of the phsyical spot of the 1st spot of the array
- how does it know what index to go to? It knows address of first cell and it knows the length
- both set and get methods for static arrays are O(1)


~ Dynamic Arrays: Ring Buffer

- methods: push, pop, unshift, shift
- @capacity, @count, @store
- everytime, u push, it increases the count
- what if we push on something and it goes over our capacity? 
    - rmr we cannot resize a static array. u can create a new array that's double the size of original array, and copy everything in original over.
    - why double instead of adding just 1? It lets us buy some free access. When we double, there's a huge spike in time compacity. Then it buys us a couple of free time. 
    - Worst case for push is O(n), average is O(1)
- pop is O(1)
- unshift - there is nowhere for u to put this element, and to create a new copy of array everytime u want to push is untenable
        - instead, let's keep track of @start_idx
        - so if we wanted to shift, we just decrease count and increase start_idx by 1 (this is dyanimic array's idx 0)
        - now, if we want to unshift, we increase count, and decrease start_idx by 1
        - however, there is still the problem if you're start_idx is 0 and there is something there. How to solve this? Ring Buffer

- Ring Buffer
        - makes this array a ring
        - so when u unshift, first element gets put into last idx
        - it is easy to get the next spot, using % capacity. Ex: if capacity is 4, and u want the next idx after 3, u do 4 % 4 == 0, which takes u back to idx 0. If u are at 0, and want the element before that, u can do -1 % 4 == 3, which takes u to idx 3.
        - the idx the user uses is still in order 0,1,2,etc, but it translates it to get the correct element
        - physical idx in static array, logical idx is used in dynamic array, we just need to make that conversion
        - this means shift/unshift is done in constant time, since we're just doing mod and add/subtract
        - ruby however, doesnt do full ring buffer