# Rails 5 up and running

## Create app

Without database:
```
$ rails new beach-hero --skip-active-record
```

With PostgreSQL database instead of SQLite3:
```
$ rails new beach-hero --database=postgresql
```

For creating an API without views:
```
$ rails new beach-api --api`
```

## Setup and configure

Set up with [HAML](https://github.com/sdrdis/haml/blob/master/REFERENCE.md), RSpec and Capybara:

```ruby
gem 'haml-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
end
```

```
$ bundle install
$ rails generate rspec:install
```

In order to add [service workers](https://github.com/rossta/serviceworker-rails), add `gem 'serviceworker-rails'` to the Gemfile, run `bundle`, and then:

```
$ rails generate serviceworker:install
```

And [read more about it](https://rossta.net/blog/service-worker-on-rails.html).

### Routes

`config/routes.rb`

```ruby
Rails.application.routes.draw do
  root 'setup#welcome'

  resources :observations do
    post 'submit', on: :member
  end
end
```

Run `rails routes` to see all routes.

### Secrets

```
$ EDITOR=vim rails credentials:edit
```

This opens the `credentials.yml` file, which is encrypted (private key is kept in `master.key`, which is per default part of the `.gitignore` file). Add any environment variables there, for example:

```
local:
  postgres:
    user: mackie
    password: messer
```

The content is then available via `Rails.application.credentials[:local][:postgres][:user]`, etc.

### Database

First create a user that the app can use to connect to the database, and adding everything necessary to the credentials (see _Secrets_ above).

Then the databases defined by the models can be setup as follows:

```
$ rails db:setup
```

This runs `db:create`, `db:schema:load`, and `db:seed`.

In order to apply pending changes in the migration files, run:

```
$ rails db:migrate
```

Migration can also be done for a particular environment only, e.g. `rails db:migrate RAILS_ENV=development`.

In order to delete the databases, run:

```
$ rails db:drop
```

Note that the above are equivalent to running `rake db:xxx`, because internally they are Rake tasks. If you run `rails` with a command option that Rails does not support natively, it automatically delegates the execution to Rake (as of Rails 5).

## Assets

```
$ rails assets:precompile
```

## Energize!

```
$ rails server
```
