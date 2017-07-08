class BeerSong
  def initialize
    @verses = [
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n",
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n",
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    ] + (3..99).map { |so_many|
      "#{so_many} bottles of beer on the wall, " \
      "#{so_many} bottles of beer.\n" \
      "Take one down and pass it around, " \
      "#{so_many - 1} bottles of beer on the wall.\n"
    }
  end

  def lyrics
    @verses.reverse.join("\n")
  end

  def verse(num)
    @verses[num]
  end

  def verses(from, to)
    @verses[to..from].reverse.join("\n")
  end
end
