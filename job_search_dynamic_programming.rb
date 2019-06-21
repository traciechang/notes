# Dynamic Programming 09/17/18

    # - Improving performance of solutions using methods that reuse work that you've already done
    # - TOP DOWN
    #     - often referred to 'memoization'
    #     - typical recursive implementation that depend on solutions further down the chain
    #     - build ur stacks and save the work to a cache as u bubble up - subsequent calls to same function within any given stack can pull the answer out of cache without incurring more function calls
    # - BOTTOM UP
    #     - uses smaller solutions as the basis of later/larger solutions
    #     - typical of iterative implentations
    #     - can use cache too, but builds it from ground up without incurring additional stacks

    # Top Down Fibonacci

    # class Fibonacci
    #     def initialize
    #         @cache = { 1 => 1, 2 => 1}
    #     end

    #     def fibonacci(n)
    #         return @cache[n] if @cache[n]
    #         ans = fibonacci(n-1) + fibonacci(n-2)
    #         @cache[n] = ans
    #         ans
    #     end
    # end

    # Time Complexity: Linear

# Bottom Up Fibonacci

# def fib_cache_builder(n)
#     @cache = { 1 => 1, 2 => 1}
#     return cache if n < 3
#     (3..n).each do |i|
#         cache[i] = cache[i-1] + cache[i-2]
#     end
#     cache
# end

# def fibonacci(n)
#     cache = fib_cache_builder(n)
#     cache[n]
# end


# Example: Longest Increasing Subsequence
    # Given an array of integers, find the length of the longest increasing subsequence.
    # Ex: [1,5,2,6,10.4,20] => 5 because [1,2,6,10,20]

    # Bottom up approach: perhaps the solution at any given point may be based on the solutions that preceded it. Meaning we can determine solution of [1,5], [1,5,2], etc.

    # - At each index, the solution is the longest preceding solution that terminates in a number less than the number we are considering (plus the current number). 
    # - If we accumulate the optimal solutions for every index, we can then choose among them.

# Remember the key to solving these types of problem is defining the recursive relationship. 
# What is the relationship between a given solution and other solutions that lead up to it?

# Burglar Problem - Dynamic Programming
    # - given an array of houses for u to rob. The integers represent the value of the houses. You want to rob so  u get the most amt of money, but cannot rob adjacent houses.

    # [1,5,16,20,3,7,10,5,10,25,17] = 62

    # - keep track of sub solutions
    # - each decision relies on relationship w/ sub solutions

    # - we make an array with the solution at each index
    # [1,5,17,25,25,32,35,37,45,62,62]

# Max Sum to Leaf Problem
    # - find max sum from root node to leaf