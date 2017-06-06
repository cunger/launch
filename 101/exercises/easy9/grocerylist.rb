
def buy_fruit(grocery_list)
  grocery_list.map { |fruit, number| [fruit] * number }.flatten
  # Note: flat_map {...} === map {...}.flatten
end

## Test

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas", "bananas"]
