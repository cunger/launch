
def contains_lab?(str)
  puts str if str =~ /lab/ # use '/lab/i' to do case-insensitive matching
end

contains_lab?("laboratory")
contains_lab?("experiment")
contains_lab?("Pans Labyrinth")
contains_lab?("elaborate")
contains_lab?("polar bear")


def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }



arr = (1..10).to_a

arr.each { |a| puts a if a >= 5 }

new_arr = arr.select(&:odd?) # == arr.select { |a| a.odd? }

puts "arr = #{arr}"
puts "new_arr = #{new_arr}"

arr << 11
arr.unshift(0)

puts "arr = #{arr}"

arr.pop
arr.push(3)

puts "arr = #{arr}"

arr.uniq!


h = { a:1, b:2, c:3, d:4 }
puts h[:b]
h[:e] = 5
puts h
h.delete_if { |_, v| v < 3.5 }
puts h


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
                ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = { "Joe Smith" => {}, "Sally Johnson" => {} }

contacts.each do |name, _|
  contact_data.each do |arr|
    email   = arr[0]
    address = arr[1]
    phone   = arr[2]
    if Regexp.new(name.split(" ").first.downcase) =~ email
      contacts[name] = { email: email, address: address, phone: phone }
    end
  end
end

puts contacts
puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]


arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |a| a.start_with? "s" }
p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |a| a.start_with?("s") || a.start_with?("w") }
p arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.map!(&:split) # == arr.map! { |a| a.split }
arr.flatten!
p arr
