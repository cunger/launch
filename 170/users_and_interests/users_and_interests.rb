require 'sinatra'
require 'mustache'

require_relative 'app/user_data'

users = UserData.new
p users

before do
  content_type :html
end

get '/' do
  redirect '/users'
end

get '/users' do
  template = File.read 'views/users.mustache'
  Mustache.render template, { users: users.list }
end

users.each do |user|
  get '/' + user.path do
    template = File.read 'views/user.mustache'
    Mustache.render template, { user: user, others: users.list_without(user) } 
  end
end
