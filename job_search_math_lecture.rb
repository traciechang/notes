# * Mathemtical functions *

# Function (in Math): f(n) is a function if it produces a unique output for every input n in its domain

# Constant: has the same output no matter what input u put in. Never changes.
#     f(n) = 5

# Linear: as the input changes, the output changes proportionally.
#     f(n) = 2n + 1
#     f(n) = an + b

# Quadratic: b and c can b zero, a cannot be
#     f(n) = an**2 + bn + c
#     f(n) = n**2

# - All 3 of the above are polynomials

# Square Root: inverse of Quadratic

# Exponential: inverse of logarithm. Grows extremely fast, faster than polynomial function. If you see one, it should be a red flag - can you do better?
#     f(n) = c * b**n
#     f(n) = 2**n

# Logarithm: inverse of exponential. Grows extremely slow
#     f(n) clogn

# Factorial:
#     f(n) = n!
#          = n * (n-1) * (n-2) * .. * 1

# - Asymptotes: a line or curve that a function approaches but does not touch or cross
#     - ex: vertical or horizontal

# - Asymptotic Behavior: behavior (outputs) of a function as input goes to +/- infinity
    # Order:
    # 1. Constant does not increase at All
    # 2. Logarithm grows second slowest
    3. Sqare Root
    4. Linear
    5. Quadratic
    6. polynomial
    7. exponential
    8. Factorial

Modular Arithmetic: a % n = b if the remainder when a is divided by n is b
    - preserved in addition, not in multiplication
    Ex: (11 + 5) % 3 = 11 % 3 + 5 % 3 = (2 + 2) % 3 = 1

Factors and Primes
    Ex. Say it asks u to find factors of 12. Take square root of 12 (rounded up is 4) and find all the pairs. So Big O would be square root.

Number System
    163 = 1 * 10**2 + 6 * 10**1 + 3 * 10**0
Binary System
    1101 = 1 * 2**3 + 1 * 2**2 + 0 * 2**1 + 1 * 2**0

Permutations and Combinations
    Permutations: you have n elements. How many ways can you order k of those elements?
    n! = n * (n-1) * (n-2)...2 * 1

    Combinations: You have n elements. How many ways can you choose k?
    n(n-1) / 2