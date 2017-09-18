
**Example: Opening and closing resources**

```ruby
def file_sandwich(file_name)
  file = open(file_name)
  yield(file)
ensure
  file.close if file
end
```

_Executing around:_ If you need to do something (repeatedly) before and after some operation, put the details of that something into a method that takes a block.

**Example: Logging**

```ruby
class Whatever
  include Logging

  def do_something
    with_logging('load database') { @data = Database.read }
    # ...
    with_logging('save database') { @data.save }
  end
end

module Logging
  def with_logging(description)
    begin
      @logger.debug("Starting #{description}...")
      result = yield
      @logger.debug("Completed #{description}.")
      result
    rescue
      @logger.error("#{description} failed!")
    end
  end
end
```

Other examples are measuring execution time, etc.

**Example: Block for initialization**

```ruby
class Specification
  attr_accessor :name, :version, :description
  def initialize
    # ...
    yield(self) if block_given?
  end
end

spec = Specification.new do |s|
  s.name = 'Whatever'
  s.version = '3.14'
  s.description = '...'
end
```

**Example: Storing operations in blocks to delay execution and to stay agnostic with respect to where a resource comes from**

```ruby
class Book
  def initialize(author, title, &block)
    @author = author
    @title = title
    @read_content = block
  end

  def content
    @content ||= @read_content.call
  end
end

book = Book.new('Author', 'Title') { File.read('path') }
book = Book.new('Author', 'Title') { FTP.get('address') }
```
