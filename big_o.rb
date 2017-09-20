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

# 7. Space Complexity