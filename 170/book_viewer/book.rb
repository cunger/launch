class Book
  attr_reader :title, :author, :chapters

  def initialize(title, author)
    @title    = title
    @author   = author
    @chapters = []
  end

  def <<(chapter)
    @chapters << chapter
  end

  def number_of_chapters
    @chapters.size
  end

  def chapter(number)
    @chapters.select { |chapter| chapter.number == number }.first
  end
end

class Chapter
  attr_reader :number, :title, :paragraphs

  def initialize(number, title, text)
    @number = number
    @title  = title
    @paragraphs = split_into_paragraphs(text)
  end

  private

  def split_into_paragraphs(text)
    text.split(/(\r?\n){2,}/)
        .map.with_index { |str, i| Paragraph.new(i, str) }
  end
end

class Paragraph
  attr_reader :index, :text

  def initialize(index, text)
    @index = index
    @text  = text
  end

  def contains?(query)
    @text.downcase.include? query.downcase
  end

  def to_html(highlight=nil)
    content = text
    content = text.gsub(highlight, "<strong>#{highlight}</strong>") if highlight
    %Q(<p id="#{index}">#{content}</p>)
  end
end
