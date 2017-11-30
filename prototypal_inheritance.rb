# JS - Prototypal Inheritance 11/27/17

# Ex: 
# function Dog (name){
#     this.name = name
# }

# Dog.prototype.woof = function() {
#     console.log(this.name + "woof")
# }

We have a Dog function -> a prototype is a property of this function
- Dog is a blank object
- prototype is an object
- a function is also an object, but it's a special object
- there is a secret property __proto for each instance of Dog you create
    - you get a pointer to the prototype function

- now say you do d.toS();
- it's going to first look in the instance - not there. Then look at prototype - not there. Then it looks at what constructor of what made prototype of Dog function. What is a prototype? An object - its an instance of Object class.

- When we make an instance of some object using a constructor function, it sets the __proto to whatever its prototype is
- Let's say we have Animal class. Dog and Cat classes will inherit from Animal. How to we set Dog's proto to Animal'ls proto?
    - Use surrogate w/ empty function and set:
    Surrogate.prototype = Animal.prototype
    Dog proto can then point to Surrogate's proto

*****************************************************
Javascript in the Browser

- Webpack is a module bundler