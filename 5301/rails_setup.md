# Rails 5 up and running

## Create app

```
$ rails new herois-do-mar --skip-active-record
$ rails new herois-do-mar --database=postgresql
```

For creating an API without views, run `rails new herois-do-api --api`.

## Setup and configure

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

### Views

In order to replace ERB by [HAML](https://github.com/sdrdis/haml/blob/master/REFERENCE.md), add to the `Gemfile`:

```ruby
gem 'haml-rails'
```

### Secrets

```
$ EDITOR=vim rails credentials:edit
```

This opens the `credentials.yml` file, which is encrypted (private key is kept in `master.key`, which is per default part of the `.gitignore` file). Add any environment variables there, for example:

```
dev:
  postgres:
    user: mackie
    password: messer
```

The content is then available via `Rails.application.credentials[:test][:user]`, etc.

### Database

After creating a user that the app can use to connect to the database, run `rake db:create`.

## Energize!

```
$ rails server
```
