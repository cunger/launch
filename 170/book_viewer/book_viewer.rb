require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

before do
  @title  = 'The Adventures of Sherlock Holmes'
  @author = 'Sir Arthur Conan Doyle'
  @toc    = File.readlines 'data/toc.txt'
end

get '/' do
  erb :toc
end

get '/chapters/:number' do
  number = params[:number].to_i
  redirect '/' if number > 12
  @chapter_title = @toc[number - 1]
  @chapter_text  = File.read "data/chp#{number}.txt"

  erb :chapter
end

not_found do
  redirect '/'
end

helpers do
  def paragraphs(text)
    text.split(/(\r?\n){2,}/)
        .map { |p| "<p>#{p}</p>" }
        .join
  end
end
