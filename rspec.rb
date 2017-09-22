# Rspec 9/19/17

# Test Driven Development (TDD) - write our test first, knowing what your code is supposed to do, and then writing our code based on this

# unit tests - test units separately
# Integration tests - test units together and how they interact
# E2E (end to end) / UI tests - tests flow throughout app. ex: filling out form and submitting on the app, then seeing that a page is rendered
# Manual tests - testing small bits of code

# Rspec Setup
# - make lib and spec folders
# - context describes a specific context that our method should be true for
# - 'let' is useful for variables that aren't the focal point of our test

# Doubles
# - creating a mock, or double, without having to initialize an instance of that class. Can respond to or call methods of that class

# protected / private methods
# - do not call these in your specs. these methods should just be called within your public methods. these will not passed in your specs if called directly