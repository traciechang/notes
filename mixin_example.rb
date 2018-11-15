module Nameable
    def initialize(name)
        @name = name
    end

    attr_reader :name

    def say_name
        puts "hello my name is #{name}"
    end
end

module Eatable
    def eat
        puts "munch munch yum!"
    end
end

module Domesticatable
    def play_fetch
        puts "throw me the ball please!!"
    end
end

# single inheritance
class Snake
    include Nameable
    include Eatable
end

class Cat
    include Nameable
    include Eatable
    include Domesticatable
end

class Dog
    include Nameable
    include Eatable
    include Domesticatable
end

razzy = Cat.new('razzy')
razzy.say_name
razzy.eat
razzy.play_fetch

demon = Snake.new('demon')
demon.say_name
demon.eat

bane = Dog.new('bane')
bane.say_name
bane.eat
bane.play_fetch