require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

require_relative 'book'

before do
  @book = example_book
end

get '/' do
  erb :toc
end

get '/chapters/:number' do
  number = params[:number].to_i
  redirect '/' if number > @book.number_of_chapters

  chapter = @book.chapter(number)
  @chapter_title = chapter.title
  @chapter_text  = chapter.paragraphs.map { |p| p.to_html }.join

  erb :chapter
end

get '/search' do
  @query = params[:query]
  @query = @query.gsub('+', '') if @query
  @matches = matches @query

  erb :search
end

not_found do
  redirect '/'
end

helpers do
  # Returns chapters with those pararaphs that match the input query
  # => [ chapter number, chapter title, [paragraph] ]
  def matches(query)
    return [] if !query || query.empty?
    @book.chapters.map { |chapter|
      [chapter.number,
       chapter.title,
       chapter.paragraphs.select { |p| p.contains? query } ]
    }
  end

  def example_book
    @book = Book.new('The Adventures of Sherlock Holmes', 'Sir Arthur Conan Doyle')

    File.readlines('data/toc.txt').each_with_index do |title, index|
      number = index + 1
      content = File.read "data/chp#{number}.txt"
      @book << Chapter.new(number, title, content)
    end

    @book
  end
end
