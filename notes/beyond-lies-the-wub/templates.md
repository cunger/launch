
View templates are files that contain text from which HTML can be generated, usually including plain HTML as well as macros to generate HTML and to embed dynamic values. When a template is rendered, it is converted into HTML, e.g. in order to be sent to the client as a response.

Sinatra requires Tilt, a generic interface for a lot of Ruby template engines, and thereby gives access to a wide range of template languages. In a very straightforward way:
```ruby
get '/' do
  erb :index
end

get '/' do
  haml :index
end
```  
Template files are expected to be in the `views` directory (or, more specifically, in the directory specified for `settings.views`, the default of which is `settings.root + '/views'`).

If there is a `layout.*` file in the `views` directory, the HTML generated when rendering a template will be included in that layout file at the place where `yield` is called (in ERB `<%= yield %>`, in HAML `= yield`). Alternatively, Sinatra's rendering method allows for specifying a different layout file or disabling any:
```ruby
get '/' do
  haml :index, :layout => :specific_layout
end

get '/' do
  haml :index, :layout => false
end
```

Templates have access to the instance variables of the application as well as to the methods defined within the block passed to `helpers`.  

# ERB

Execute code and include its return value in the rendered template:
```
<%= some code %>
```

Execute code without displaying its return value:
```
<%  some code %>
```

**Example:**
```
<ul>
<% @books.each do |book| %>
  <li><%= book.title %></li>
<% end %>
</ul>
```

## Escaping HTML

Either explicitly escape content:

```ruby
# App
helpers do
  def h(content)
    Rack::Utils.escape_html(content)
  end
end

# Template
<%= h(user_input) %>
```

Or escape content per default and explicitly disable escaping:

```ruby
# App
configure do
  set :erb, :escape_html => true
end

# Template
<%= auto-escaped content %>
<%== non-auto-escaped content %> # e.g. <%== yield %>
```

# HAML

Execute code and include its return value in the rendered template:
```
= code
```

Execute code without displaying its return value:
```
- code
```

divs are default elements, mark them with `.` (class) or `#` (id) as in CSS, e.g.
class: `.flash`
id: `#flash`

## Partials

```
= haml :_flash, :layout => false
```

http://www.semicomplete.com/blog/geekery/partials-in-haml-in-sinatra.html
