# How to make a fast Hash Map 9/22/17

# Set
# {}
# - each object only exists once, not ordered, no 'first' element
# - you can have:
# 	.include?
# 		=> O(n). You scan every element
# 	insert -> you should check first if what you're inserting already exists, then push to end
# 		=> O(n) because you need to scan if it already exists
# 	delete
# 		=> O(n) because you need to check if you have it

# - these time complexities are very bad, how to improve?
# - Ex: {2,1,4,0}
# 	- take the min and max of this set, so 0 -> 4
# 	- create an array with indices 0 -> 4, so [_,_,_,_,_]
# 	- say you initialize this array with values of False in each index. Then as you insert into the Set, you set each corresponding index to True
# 	- So you'd set indices 2,1,4,and 0 to be True [T, T, T, F, T]. THen all you have to do is [T, T, T, F, T][2] to see if 2 exists in the Set
# 	- why is this more efficient? [T, T, T, F, T][2] takes O(1) time
# - Ex: [3,5,8,10,12]. Each number is stored in a block in RAM w/ RAM address:
# 	3   5  8   10   12
# 	908 916 929 932 940
# 	the array knows the start RAM address is 908, and the length, which is 5. All it needs to do is 908 + 8*index (pointer arithmetic), 
# 	this operation is O(1) time, to find what you want.
# 	Array never has any gaps and nothing take more than 1 block
# - Inserting is O(1) time
# - Include? is also O(1)
# - delete is O(1)
# - these times are also bad, why?
# 	- takes up abysmal space, it will not work w/ big sizes
# 	- floats can have arbitrary decimal points

# Ex: {1,4,6,64,128,129} this has 7 spaces
# [ , , , ] this only has 4 buckets, with indices 0-3
# - find a way to put each element in a bucket and when you query for the number, will always get same bucket
# - we can do this by using % and placing the number in the bucket that equals the remainder when divided by length of the data structure (which is 4 in this case):
# 0 index: 4, 64, 128
# 1 index: 1, 129
# 2 index: 6
# 3 index
# - Then you'd just do, for example, 6 % 4 = 2, go to bucket 2, and scan for 6 to see if 6 is in the set. Same process for delete and insert
# - Now, even when you have a number like 10^20, you can just mod by 4 and place into right bucket.
# - But how many things would we have to look thru in each bucket? n/k, in this case, n/4, assuming it's randomly distributed accross buckets,
# which mean O(n). This is true for include, insert, and delete, because we need to check where everything is.
# - this is no better than original idea. the problem with n/k is k stays the same while n stays bigger
# - how might we get k to grow in proportion to k? so that it becomes n/n = 1, which becomes constant

# Ex:{1,4,6,3,8,9,11} these are the elements we want to insert into our set
# - again we have 4 buckets and mod everyhitng by 4
# ind 0: 4
# ind 1: 1
# ind 2: 6
# ind 3: 3
# - k = 4 and n = 4 right now. as soon as you add 5th element, n overtakes k
# - when this happens, it triggers a resize. you will now create an array w/ 5 buckets. but you can't just copy original buckets, those elements may not be going into same buckets
# - now, you have to % every thing by 5
# - insert: O(n) because you have to re-mod everything
# - assuming that elements are randomly distributed, then n/k, if k is equal to or greater than at all times n, then n/k <= 1
# - because of this, include and delete is O(1). this is not going to scale because # of buckets is growing too, so # of elements in bucket won't be exessive
# - but we still have slow insertion
# 	what if for one element, we insert n buckets

# Example:{1,4,6,3,8,9,11} with 2 buckets to start. when we hit 3rd element, we double our buckets to 4 (we get 2 free pushes)
# - then we'd double again to 8 buckets when n = k, etc. so whenever we double, it's n * 2 + n, therefore 3n/n = 3
# - amortization O(1) - you pay up front
# - space complexity O(n) because number of buckets scales with n

# Example: {0,2,4,8,16,32}, start w/ 4 buckets
# - pathological input
# - everything (or majority) goes into same bucket, insert, include, delete become O(n) => worst case

# *****************************************************
# Hashing

# - key characteristic: 
# 	- deterministic => the output will always be the same for the same input
# 	- uniform
# 	- one-way, highly sensitive => given the output, there's nothing we can predict about the input. there's no info in the output that can help u determine input
# - some regular hashing functions (faster):
# 	- crc32
# 	- cityhash
# 	- murmurhash
# - examples of Cryptographic (slower and have fewer collisions. better if you're concerned about security)
# 	- MD5
# 	- SHA-1
# 	- Blowfish

# - every object in ruby has a .hash function
# - when you hash something, you get an output like 2348928374 or sdf0834lkj243
# - it takes the object id and hashes it, like object_id.hash
# - this could be bad because in the case of 2 empty arrays, you think they are equal, but they have diff object ID's. So if you do
# s = Set.new
# s << []
# s.include?([]) => false

# - that's why the hash function is overwritten in the Array class to prevent this.

# *****************************************************
# Hash Set

# example: {2,4,8,16,'hello','dolly'} and 4 buckets
# - input each element into a hash function and the output will be something like 384923847, then % this number by 4. this way, you won't have the previous problem
# of alot of things going into one bucket
# - Now, say you want to check if it has 2 (include? 2). You'd take hash of 2, which will always be same output, and % by 4, which would be the same as before, and locate that bucket.
# The average # of things in that bucket is 1. The average time is O(1)
# 	- Worst case is O(n), if unlucky and everything goes into 1 bucket
# - insert and delete: average O(1), worst case O(n)

# *****************************************************
# Linked Lists and Hashmaps

# **Linked Lists

# - linked list is just like a unary tree: o -> o -> o -> o This is a singly-linked list. each node has a value, which can be anything
# - the first element in list is the head. the last element is the tail. 

# class Link
# 	def initialize(val, next = nil)
# 		@val = val
# 		@next = next
# 	end
# end

# find => O(n)
# push => O(n) because you have to iterate to last place of list to push it there. You could store tail and then jump to tail and push it, which it'd be O(1)
# unshift => O(1)
# delete, insert => O(1) say you know which point you want to delete. you can just go to the node before it and change its pointer to skip the next one and point to the one after
# 	How to do this? Doubly-linked list (everything has an @prev as well as an @next) So you can go to a node and see it's previous element
# 	You need to also set the prev of the other element to the new prev

# - An empty linked list still has a head and tail, with @prev and @next. They never get deleted.

# ** Hashmap

# - you would store the key and value into same node, along a/ @prev and @next

# Example: now going back to the buckets, image the buckets are linked lists, pointing downwards.
# {1=>1, 2=>4, 3=>9, 4=>16} with 4 initial buckets
# - You would take the key (since only unique keys allowed in hashmap), and call .hash on it and mod that number by 4.
# - the buckets would be linked lists storing the key and values
# - Now, say you want to find hash[1], 1.hash, mod that by 4, go to bucket, find it, and return value of 1
# - Say you want to set hash[1] = 2. Do same thing, find 1.hash, mod that by 4, go to bucket, find key with 1, and change value to 2
# - You can also set hash[7] = 2 (where 7 didn't initially exist). It will just add to the next position in linked list

# *****************************************************
# Caching

# - Imagine game like Mario where player keeps running, but may decide to run back to where he was. He expects to see the same things he saw when he passed that initial place
# earlier. You don't want to have to re-render all the objects, so may want to store in cash
# - Or think of earlier FB app on older phones, when you scroll down, things like stories and photos get rendered, but because cache was small, when u scroll back up,
# you see the same things being re-rendered again, and it takes a while to load.
#  	- however, we don't have enough memory to hold *everything* in memory
# - how to decide what lives (stored in the cache) and what gets deallocated?
# - most common method:
# LRU (Least recently used)
	
# - Say CASH_SIZE = 3
# so when it reaches 3, it will start deleting
# It will delete the least recently used thing

# Ex using hashmap: {
# mario => mario object
# cloud => cloud object
# coin20 => coin object
# }
# Say the cloud was out of frame for 10 seconds, you can delete the could and add goomba object. So delete oldest thing and move on
# - We can store the timestamps of last time accessed:
# {
# mario => [mario object, 8:00]
# goomba => goomba object, 7:59]
# coin20 => [coin object, 8:00]
# }
# - Say we've built next object but cache is full. Look at the minimum timestamp (this will take O(n) time cuz hashmap is not sorted)
# - Ejection, Insertion => O(n)
# - Read => O(1)

# How do we get Insertion to be faster? How can we order it so that we can just take the first element?
# - use linked list:
# render mario -> render goomba -> render coin
# - now, you can just set @head to goomba and add cloud object to end
# - ejection => O(1)
# - Insertion => is not always O(1), cuz u need to first check if thing is in cache. if only appending to end, then O(1)
# - When you acess something, that thing becomes most reccent thing and gets moved to the end
# - Read is worst case O(n) because u need to go thru list to find it

# This solution is just opposit of our first one, how do we get all to be O(1) time?
# - Build the hashmap AND the linked list
# {
# mario => point to the linked object containing mario object (the linked list will list recently used to least recently used)
# bowser => 
# goomba => 
# }

# - To eject oldest person, access the linked list and update @prev and @next, and delete key from hashmap. Total time O(1)
# - To insert, append to top of linked list, add to hashmap. Time O(1)
# - Read, just read hashmap in O(1) time

# Why this would not work w/ array:
# - you don't have a stable reference when pointing to array indices