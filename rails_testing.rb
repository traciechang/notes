# Rails Testing 11/13/17

# **Setup**

# - in Gemfile, groups such as :test and :environment specify what environment the gems under it are available in

# > rails g model TestModel

**Models**
What to test?
1. validations
2. associations
3. class methods
4. error messages

- shoulda-matchers gem gives us one line assertions to test our models. It gives us better error messages too.
    - when testing uniqueness, rmr that it looks for exising records and compares it to them. If you don't have any records, it will give an error, even when unique

**Factories**
- Factory girl
    - generate fake instances of models we are creating
    - reason why use curly braces is to get a new name every time
    - we can overwrite specific attributes if we desire
    - FactoryGirl.build vs .create -> create actually creates in database and takes longer. Build is similar to New
- Faker
 - randomly generates data

 **Controllers**
 - expect(response) -> response is not defined anywhere, but when you make a request on the line above it, it defines it

 **Capybara**