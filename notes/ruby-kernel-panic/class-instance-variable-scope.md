# Class and instance variable scope

Class and instance variables capture _state_. Unlike local variables, they are accessible across method calls. More specifically, they can be scoped on two different levels:
* _class level_ (meaning they are available in all class methods)
* _instance level_ (meaning they are available in all instance methods)

**Class variables `@@var` are scoped at the class level**, i.e. they are available in all class methods, independently of where they have been initialized.

There is only one copy of a class variable: All subclasses and also all instances of the class share that one copy. As a result of the latter, they are also available at object level, i.e. in all instance methods.

**Instance variables `@var` are scoped at the instance level**, i.e. they are available within instance methods. Instance variables that are used but not explicitly initialized evaluate to `nil`.

**Class instance variables** are instance variables at class level, and they belong to that class exclusively. They are thus good for storing class-specific stuff that you don't want to be shared across all subclasses and instances.

Here is an overview of this:

```ruby
class Test
  @ivar1 = 1 # class instance variable
  @@var1 = 1 # class variable

  def set
    @ivar2 = 2 # instance variable
    @@var2 = 2 # class variable
  end

  def self.set
    @ivar3 = 3 # class instance variable
    @@var3 = 3 # class variable
  end

  def instance_method
    # Class variables:
    # @@var1 => 1
    # @@var2 => 2
    # @@var3 => 3

    # Instance variables:
    # @ivar2 => 2

    # Class instance variables:
    # @ivar1 => nil
    # @ivar3 => nil
  end

  def self.class_method
    # Class variables:
    # @@var1 => 1
    # @@var2 => 2
    # @@var3 => 3

    # Instance variables:
    # @ivar2 => nil

    # Class instance variables:
    # @ivar1 => 1
    # @ivar3 => 3
  end
end
```
