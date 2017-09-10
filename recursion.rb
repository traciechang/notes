# Recursion 9/9/17

# What is recursion?
# - function that calls itself
# - ex. factorial
# - 6! = 6 * 5 * 4 * 3 * 2 * 1
# - 6 * 5! = 5 * 4 * 3 * 2 * 1

# Base Case
# - it needs to stop at one point
# - in the factorial example, 1! = 1 is the base case

# Recursion vs iteration
# - anything that can be done recursively can be done iteravelly
# - recursion may be more elegant

# Code examples:

# def factorial(n)
# 	return 1 if n == 1 # base case
# 	n * factorial(n-1) # inductive step
# end

# def iterative_upcase(str)
# 	str.chars.inject("") do |upcased_str, char|
# 		upcased_str << char.upcase
# 	end
# end

# def upcase(str)
# 	return str.upcase if str.length <= 1 #base case
# 	str[0].upcase + upcase(str[1..-1]) #inductive step
# end

# def reverse(str)
# 	return str if str.length <= 1
# 	str[-1] + reverse(str[0..-2])
# end

# "Hello" => "olleH"
# "Hell" => "lleH"

# def quick_sort(arr)
# 	return arr if arr.length <= 1
# 	pivot_arr = [arr.first]
# 	left_side = arr[1..-1].select { |el| el < arr.first }
# 	right_side = arr[1..-1].select { |el| el >= arr.first }
# 	quick_sort(left_side) + pivot_arr + quick_sort(right_side)
# end

# Quick sort intro
# [4, 12, 3, 9, 8, 2, 7]
# use 4 as the pivot
# partition things that are smaller than 4 and bigger than 4
# [3, 2, 4, 12, 9, 8, 7]
# then sort everything before 4 and everything bigger than 4
# so [12, 9, 8, 7] becomes its own array, use 12 as pivot, and it will be
# [9, 8, 7, 12], and so on
# the base is an array with length of 1 or 0

# Stack overflow
# - there were so many stack frames or recursive calls that the system ran out of memory
# - usually caused by your recursion failed to stop
# - it could also be because your input was too big. there may be a limit to number of frames allowed on server.
# 	-> in this case, your code was written correctly with a base case that it eventually could hit, but too many frames so ruby stopped it
# - stack overflow is there to stop you from going into infinite loop
# - Ex.def factorial(n)
# 	n * factorial(n-1)
# 	end

# The Stack
# - main -> includes functions that live in main
# 	-> any function you define in main, any local variable you define in main
# 	-> line number
# Ex. we define a function called reverse that reverses a string and call it (refer back to recursive reverse function that we wrote earlier)
# -> it jumps into the function that we have called (creates new frame and freezes on line in main that it is called)
# -> reverse then has its own local vars. However, it cannot move on until it evaluates the portion of reverse(str[0..-2])
# -> it will create a new stack frame for reverse(str[0..-2]) and freeze again on the line where it was previously called
# -> and so on.
# -> once it hits return str if str.length <= 1, the frame gets popped off the stack. remember the whole time, this entire stack is stored in memory
# -> any recursive problem will keep pushing stack frames in order to solve the problem
# -> keep popping off the stack frame until you reach main again
