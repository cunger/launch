require 'sinatra'
require 'mustache'

require_relative 'app/user_data'

users = UserData.new

before do
  content_type :html
end

get '/' do
  redirect '/users'
end

get '/users' do
  template = File.read 'views/users.mustache'
  Mustache.render template, { users: users.list,
                              number_of_users: users.number_of_users,
                              number_of_interests: users.number_of_interests }
end

users.each do |user|
  get '/' + user.path do
    template = File.read 'views/user.mustache'
    Mustache.render template, { user: user, others: users.list_without(user) }
  end
end
