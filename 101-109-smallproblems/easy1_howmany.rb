
def count_occurrences(array)
  occurrences = {}

  array.each do |element|
    # if occurrences.key? element
    #   occurrences[element] += 1
    # else
    #   occurrences[element] = 1
    # end
    occurrences[element] = array.count(element)
  end

  occurrences.each { |element, count| puts "#{element} => #{count}" }
end

## Examples

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)
