
### RSpec

```ruby
group :development, :test do
  gem 'rspec-rails'
end
```

```
$ bundle install
$ rails generate rspec:install
```

### Factory Bot

```ruby
group :test do
  gem 'factory_bot_rails', require: false
end
```

### Database Cleaner

```ruby
group :test do
  gem 'database_cleaner'
end
```

### Capybara

With Webkit:

```ruby
group :test  
  gem 'capybara', '>= 2.15'
  gem 'capybara-webkit'
end
```

Requires Qt.

In `rails_helper.rb`:

```ruby
Capybara.javascript_driver = :webkit
```

With Selenium:

```ruby
group :test  
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'geckodriver-helper'
```

# Run all tests

```
$ bundle exec rspec
```
