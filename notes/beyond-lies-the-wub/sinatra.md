
# Sinatra  

Sinatra is a Rack-based framework for creating web applications in Ruby, providing a domain-specific language for that purpose.

The backbone of a Sinatra application are _routes_, which tie specific URLs directly to relevant Ruby code blocks. The method (`get`, `post`, etc.) indicates the HTTP method, and the code block that is passed to the method determines what is sent as response (the return value of that block will be the response body). Here is a minimal example:

```ruby
require 'sinatra'

# 1

get '/' do
  # 2
  'Hello world!'
end
```

A big part of Sinatra's magic lies in its handling of `self`. At point 1 in the example above, we are at the top level, so `self` is the object `main`, an instance of `Object`. At point 2, `self` is an instance of `Sinatra::Application`. How does this happen? When we `require 'sinatra'`, it itself loads `sinatra/base` and `sinatra.main`.

`sinatra/base` is the heart and bones of Sinatra, defining among others:
* the classes `Sinatra::Request` and `Sinatra::Response` (subclasses of `Rack::Request` and `Rack::Response`, respectively)
* the modules `Sinatra::Helpers` and `Sinatra::Templates`
* the classes `Sinatra::Base` and its subclass `Sinatra::Application`
* the module `Sinatra::Delegator`

`Sinatra::Delegator` is a mixin extending `Object`, so all methods defined there are available in every `Object`. It defines methods like `get`, `post`, `before`, `after`, `enable`, `helpers`, etc. -- simply delegating them to the `Sinatra::Application` class, which inherits the definition of those methods from the `Sinatra::Base` class -- there they contain what is actually happening when they are called.

Upon each HTTP request, a fresh instance of `Sinatra::Application` is created.

`Sinatra::Application` also defines the class method `run!`, which starts the underlying web server.


## Routing

Data payload, URL parameters, and query string parameters are store in the `params` hash.

```ruby
get '/book/:id' do
  id  = params[:id]
  res = params[:resolution] # e.g. /book/23?resolution=low
end

post '/login' do
  username = params['username']
  password = params['password']
end
```

URL parameters are also handed to the code block:
```ruby
get '/book/:id' do |id|
end
```

**Note:** First match wins.

* `'/book/new'`
* `'/book/:id'`

If it exists, the `not_found` route is invoked to process those paths for which no route is found:

```ruby
not_found do
  # 404
end
```
