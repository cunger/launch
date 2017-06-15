
def gather(items)
  puts "Let's start gathering food."
  yield items
  puts "We've finished gathering!"
end

def pass_on(array)
  yield array
end

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class GatherTest < Minitest::Test
  def setup
    @items = ['apples', 'corn', 'cabbage', 'wheat']
    @birds = ['raven', 'finch', 'hawk', 'eagle', 'osprey']
  end

  def test_gather_with_block
    gather(@items) do |items|
      items.each { |item| assert_instance_of(String, item) }
    end
  end

  def test_pass_on_with_block
    expected = @birds[2..-1]
    actual = pass_on(@birds) { |_, _, *raptors| raptors }
    assert_equal(expected, actual)
  end
end

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

items = ['apples', 'corn', 'cabbage', 'wheat']

gather(items) do |*heads, last|
  puts heads.join(', ')
  puts last
end

gather(items) do |first, *middle, last|
  puts first
  puts middle.join(', ')
  puts last
end

gather(items) do |first, *tail|
  puts first
  puts tail.join(', ')
end

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end
