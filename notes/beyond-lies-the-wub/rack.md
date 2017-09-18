Rack provides a minimal API for connecting web servers and applications in Ruby. It is both a specification of an abstract interface - a [protocol](http://www.rubydoc.info/github/rack/rack/master/file/SPEC) that specifies in which format the web server should send the request to the app, and in which format the app should return the response - and a reference implementation of that interface.

Rack thereby provides a shared interface in between web servers and applications or frameworks, allowing for communication between all servers and apps that are Rack-compliant, i.e. adhere to its specification. It is now the _de facto_ standard in Ruby web development, with frameworks like Sinatra and Rails building on it.

Whenever a request is made to the server, Rack turns this request into a hash `env` - containing the request headers, server information provided by the actual underlying web server, and rack info. It will then call the app's method `call`, passing the `env` hash as argument. Rack then expects the method call to return an array containing three elements:
* the HTTP response code (responding to `to_i`, yielding an integer >= 100)
* the headers (basically a hash: must respond to `each` and yield values of key and value)
* the response body (must respond to `each` and yield strings bzw. objects that respond to `to_s`)
From those elements, Rack constructs the response to send back.

_Example:_

```ruby
class Application
  def call(env)
    status  = 200
    headers = { 'Content-Type' => 'text/plain' }
    body    = ['Fnord!']

    [status, headers, body]
  end
end

run Application.new
```

The reason the expected method is `call` is to allow for anonymous functions to work as well:

```ruby
application = lambda do |env|
  [200, { 'Content-Type' => 'text/plain' }, ['Fnord!']]
end

run application
```

The `rack` gem comes with a command line tool `rackup` that looks for a file `config.ru` in the current directory, and starts a local web server using it.

## Resources

http://jasonseifer.com/2009/04/08/32-rack-resources-to-get-you-started
