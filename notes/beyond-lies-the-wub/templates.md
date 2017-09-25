
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
