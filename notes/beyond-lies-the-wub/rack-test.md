
```ruby
ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative 'path/to/app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    # assertions
  end
end
```

`Rack::Test::Methods` provide functionality for mocking requests and responses. They expect a method `app` that returns a Rack application.

The response to the request is accessible via `last_response`, an instance of the class `Rack::MockResponse`. This class provides instance methods `status`, `body`, and `[]` for the response headers.  
