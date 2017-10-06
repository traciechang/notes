# Big-O 9/20/17

# 1. Motivations
# Is algorithm A better than algorithm B
# - to determine, we need to determine what is considered "better" => speed
# - what factors determine speed of algorithm?
# 	hardware
# 	number of steps, how many things the algorithm does
# 	language implementation
# 	input (ex. you want to find a letter in a string. a short string vs a long string will make a difference)

# - what factors are determined by the algorithm?
# 	number of steps
# 	input - it specifies the type of input and how many input, etc.

# 2. RAM Model of Computation
# what constitutes a step?

# - a model of computation allows us to do is abstact the away small insignificant details
# - there are several models of computation
# - RAM: random access machine

# RAM Model of Computation
# - mathematicals such as (+, -, *, /, >, <, ==, etc.) are 1 step
# - loops
# 	total steps = number of times we're looping * steps in each loop
# - memory access: 1 step
# - function calls: 1 step

# 3. Asymptotic Analysis

# Example 1 (count # of steps):

# def chop_add(num1, num2)
# 	num1 = num1 / 5.0 => the reassignment to num1 is another type of memory access, num1 is a memory access, division => 3 steps
# 	num2 = num2 / 5.0 => 3
	
# 	300.times do => 300 * (3 + 3)
# 		num1 = num1 / 2 => 3
# 		num2 = num2 / 2 => 3
# 	end
	
# 	sum = num1 + num2 => memory access to num1, memory access to num2, memory access to store to sum, addition => 4
	
# 	300.times { sum = sum * 2 } => 300(3)
	
# 	sum * 5
# end	

# total: 2710 steps 

# Example 2:

# def iter_add(num1, num2)
#  num1.times { num2 = num2 + 1 } => memory access to reassign num2, memory access to num2, add => 3n
#  num2 => 1
# end

# total: 3n - 1

# How to compare?

# Example 1:
# - used desmos.com/calculator
# - graph y = 2710
# - on the x axis, you can see that no matter how x grows or decreases, the # of steps will always be 2710

# Example 2:
# - plot y = 3x + 1
# - you can see that as the input size(n) grows, so does the number of steps

# So to answer which algorithm is better, it depends on input. If input size is less than a thousand, iter_add is preferable
# If over 1,000 chop_add is preferable.

# Asymptotic Analysis
# - asymptotic: approaching a value arbitrarily close
# - how we describe behavior of a line as it approaches arbitrary limit (in this case, infinite)
# - behavior of a line (straight, diagonal, log, exponential, etc)

# What does this mean?
# - we ignore constants. These do not affect the behavior of the line. The line may shift positions, but behavior stays same
# - dominant term
#  Ex: 3n + 1 => 2 terms: 3n and 1 => 3n is the dominant term. As n becomes larger, 1 becomes less significant
# to the point it will not affect the behavior of the line
# 	Your algorithm is only as fast as your bottleneck (slowest part)

# Going back to 
# - chop_add (2710 steps) => since this is just one constant, runtime would be 1
# - iter_add (3n + 1 steps) => take out constants 3 and 1, left w/ n => runtime is n
# 	another way to look at iter_add is both constants would equal 1, so you end up with n + 1
# 	then determine which is is dominant, which is n

# - for now, ignoring things on the left of 0 on the graph because you can't have negative inputs

# 4. The Worst Case

# Example:
# def linear_search(arr, val)
# 	arr.each_with_index do |el, i|
# 		return i if el == val
# 	end
# 	-1
# end

# In this example, you may want to say runtime is n, but you may end early if el == val
# - This has the best case (if el is at very front of arr)
# - Worst case (el is not in arr at all) => so the runtime WOULD be n
# - Average case

# What is Big O?
# - asymptotic worst-case runtime
# - so the runtime of this algorithm is O(n)
# - Why are we so concerned w/ worst case? We can confidently say it can be no worse than this.

# 5. Big-O Classifications (most common, from fastest to slowest)
# 	O(1) - constant time algorithm. Its runtime is independent of its input size
# 	O(logn) - Logarithmic (inverse of exponent)
# 		- at every input space, it is being divided
# 		- if divided by 2, it means log base 2
# 		- if divided by 3, log base 3
# 		- Ex. If you're looking thru phonebook for your name, log would divide book by half, see if name is in left half or right half
# 		then go to that half and divide in half again, and so on (ex: binary search)
# 	O(n) - Linear
# 	O(n logn) - Log Linear
# 		- Examples: merge sort, quick sort(best & average cases)
# 	O(n^2) - Quadratic
# 		- ex: nested loops (nested twice), bubblesort (worst case)
# 		- O(n^k) - polynomial
# 			- Ex. deeply nested nested loops
# 	O(2^n) - Exponential
# 		- ex: subsets
# 		- O(k^n)
# 	O(n!) - Factorial
# 		- ex: permutation

# 6. Set Definition
# - O(g) = { f| f does not dominate g }
#   equals set of functions where f does not dominate g
#   if g = n^2, some functions where f does not dominate g would be n, 2n, 2n + 1000, n^2, 3n^2 + 4000
  	
#   if an algorithm is O(n^2), it is also O(n!) because if something doesn't dominate n^2, it does not dominate n!
#   - an algorithm O(2n^2) = O(n^2), but you would never say that you have O(2n^2)
#   - always want to use the asymptotic version of the function
  
# - say a function has different parts and one part is O(n) and another is O(n^3)
# 	The overall runtime is O(n^3) because overall is its bottleneck
  
# 7. Space Complexity
# How much space is our algorithm taking up relative to size of input? How does it scale when input size grows?
# - Ex: write a function that take two arrays, where array1 contains 1 element that array2 doesn't have. 
# 	Otherwise, they are both same, but may not be in same order. Find that element.
# 	- Naive approach is to create a hash and count number of each unique element, then subtract those in
# 	second array, then see which element still has value of 1.
# 	- The hash is taking up memory, and will grow as number of unique elements in your arrays grow
# 	- Instead of O(n), can we make it O(1), where regardless of # of elemements, we take up same amount of space?
	
# - use XOR	(symbol is ^)
# array1 = [2, 7, 3, 2, 8]
# array2 = [2, 3, 8, 3]

# - say we are using a hypothetical 4 bit computer

# 0010   (bit representation of 2)
# 0111 ^ (bit representation of 7)
# _______
# 0101
# 0011^  (3)	
# _______
# 0110	
# 0010   (2)
# ________
# 0100
# 1000 (8)
# _______
# 1100  (now XOR array2 into this)
# 0010  (2)
# _______
# 1110
# 0010  (2)
# _______
# 1100
# 1000  (8)
# _______
# 0100 
# 0011  (3)
# _______
# 0111 => 7

# ************************************************************

# By I

# # my_min


# # Given a list of integers find the smallest number in the list.

# # Example:

#     # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     # my_min(list)  # =>  -5

# # O(1) => constant
# # O(n) => linear
# # O(n^m) => quadratic
# # O(log n) => logarithmic
# # O(n!) => factorial

# # Phase I

# # First, write a function that compares each element to every other element of the list.  Return the element if all other elements in the array are larger.
# # What is the time complexity for this function?

# # [2, 5, 3]
# def my_min(nums)
#     nums.each do |num|
#       return num if nums.all? { |num_2| num_2 > num }
#     end
#   end
  
#   # quadratic, O(n^m)
#   # O(n^2)
  
#   # Phase II
  
#   # Now rewrite the function to iterate through the list just once while keeping
#   # track of the minimum.  What is the time complexity?
  
#   # [2, 5, 3]
#   def my_min(nums)
#     min = nil
#     nums.each do |num|
#       min = num if min.nil? || num < min
#     end
#     min
#   end
  
#   # linear, O(n)
  
#   # if i have 3 numbers in my array, my_min needs to perform 3 operations, or check 3 numbers, in order to determine the min
#   # therefore, this solution scales linearly, O(n) time complexity
  
#   # [4, 6, 3]
#   # [1, 0, -1]
#   def greater_than_2(nums)
#     final = []
#     nums.each do |num|
#       final << num if num > 2
#     end
#     final
#   end
  
#   # what's the time complexity?
#   # linear, O(n)
#   # what's the space complexity?
#   # worst case
#   # more space
#   # O(n)
  