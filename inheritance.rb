# Inheritance by I 9/20/17

# Inheritance
# - models things based on WHAT THEY ARE
# - by default, whale inherits all behaviors of mammal

# Composition
# - modeling things based on WHAT THEY DO

# A solution:

# module AirBreathable
# 	def breathe
# 		puts "i'm breathing air"
# 	end
# end

# module WaterBreathable
# 	def breathe
# 		puts "i'm breathign water"
# 	end
# end

# class Human
# 	include AirBreathable
# end

# class Whale
# 	include WaterBreathable
# end

# - the reason why this helps is because when you see whale.breath, you can easily trace it back to WaterBreathable
# - if you do inheritance, you risk Mammal inheriting from Animal, inheriting from Living Being, etc.
# - when including modules, you don't need to be concerned about DRY - they are meant to be used
# - modules mean that you are using it more than once, don't write a module for the sake of writing one and only use it once


# =============

# # inheritance
# # one class inheriting behavior from another

# class Animal < LivingBeing
#   def breathe(element = 'air')
#     puts "i'm breathing #{element}"
#   end
# end

# class Mammal < Animal
#   # warm-blooded
#   # live-birth
#   # milk
#   # shit
#   # vertebrae
#   # breathe
#   #
# end

# class Human < Mammal
#   # breathes AIR
#   # humans breathe air
#   #
# end

# class Whale < Mammal
#   # breathes WATER
#   #
# end

# whale.breath

# # by default, truck will have ALL the things defined in Vehicle UNLESS we overwrite it with another method on truck
# # inheritance is modeling things based on WHAT THEY ARE

# # composition

# # composition is modeling things based on WHAT THEY DO
# #

# module AirBreathable
#   def breathe
#     puts "i'm breathing air"
#   end
# end

# module WaterBreathable
#   def breathe
#     puts "i'm breathing water"
#   end

#   def can_breath_water?
#     true
#   end
# end

# module Swimmable
#   def swim
#     puts "swim"
#   end
# end

# module WaterCreaturable
#   include Swimmable
#   include WaterBreathable
# end

# class Fish
#   include WaterCreaturable
# end

# class Human
#   include AirBreathable
#   include Swimmable

#   def can_breath_water?
#     false
#   end
# end

# class Whale
#   include WaterCreaturable
# end








# whale.breath

# class Human
#   include AirBreathable
# end

# class Whale
#   include WaterBreathable
# end

# class Fish
#   include WaterBreathable
# end

# class Dog
#   include AirBreathable
# end

# # modules MEAN that you're using more than once


# # S in SOLID
# # SINGLE_RESPONSIBILTY_PRINCIPLE
# #

# # O IN SOLID
# # Open/Closed Principle
# # => Classes should be OPEN to extensibility
# # => CLOSED to modification/change
# #
# # you should write code that is EASY and SIMPLE to ADD new functionality WITHOUT changing your exiting code# inheritance
# # one class inheriting behavior from another

# class Animal < LivingBeing
#   def breathe(element = 'air')
#     puts "i'm breathing #{element}"
#   end
# end

# class Mammal < Animal
#   # warm-blooded
#   # live-birth
#   # milk
#   # shit
#   # vertebrae
#   # breathe
#   #
# end

# class Human < Mammal
#   # breathes AIR
#   # humans breathe air
#   #
# end

# class Whale < Mammal
#   # breathes WATER
#   #
# end

# whale.breath

# # by default, truck will have ALL the things defined in Vehicle UNLESS we overwrite it with another method on truck
# # inheritance is modeling things based on WHAT THEY ARE

# # composition

# # composition is modeling things based on WHAT THEY DO
# #

# module AirBreathable
#   def breathe
#     puts "i'm breathing air"
#   end
# end

# module WaterBreathable
#   def breathe
#     puts "i'm breathing water"
#   end

#   def can_breath_water?
#     true
#   end
# end

# module Swimmable
#   def swim
#     puts "swim"
#   end
# end

# module WaterCreaturable
#   include Swimmable
#   include WaterBreathable
# end

# class Fish
#   include WaterCreaturable
# end

# class Human
#   include AirBreathable
#   include Swimmable

#   def can_breath_water?
#     false
#   end
# end

# class Whale
#   include WaterCreaturable
# end








# whale.breath

# class Human
#   include AirBreathable
# end

# class Whale
#   include WaterBreathable
# end

# class Fish
#   include WaterBreathable
# end

# class Dog
#   include AirBreathable
# end

# # modules MEAN that you're using more than once


# # S in SOLID
# # SINGLE_RESPONSIBILTY_PRINCIPLE
# #

# # O IN SOLID
# # Open/Closed Principle
# # => Classes should be OPEN to extensibility
# # => CLOSED to modification/change
# #
# # you should write code that is EASY and SIMPLE to ADD new functionality WITHOUT changing your exiting code