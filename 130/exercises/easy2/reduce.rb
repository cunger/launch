
def reduce(collection, initial)
  value = initial
  collection.each { |item| value = yield value, item }
  value
end

p reduce(['hi', 'ha'], '>') { |str, s| str + s + '!' } == '>hi!ha!'
p reduce((5..10), 0) { |sum, n| sum + n } == 45
p reduce({}, 1) {} == 1
