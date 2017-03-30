
## 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash1 = {}
flintstones.each_with_index { |name, index| hash1[name] = index }

hash2 = {}
flintstones.map.with_index { |name, index| hash2[name] = index }

hash3 = flintstones.each_with_object({}) { |name, hash| hash[name] = flintstones.index name }

p hash1
p hash2
p hash3

## 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.reduce(:+)

## 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.reject { |_, v| v >= 100 }
p ages.select { |_, v| v < 100 }

## 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

## 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

i = nil
flintstones.each_with_index do |name, index|
  if name.match /^Be/
    i = index
    break
  end
end
p i

p flintstones.index { |name| name.start_with? 'Be' }

## 6

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones

## 7

statement = "The Flintstones Rock"

hash = {}
statement.each_char { |char| hash[char] = statement.count char }

p hash

## 9

def titleize(str)
  str.split(' ').map { |word| word.capitalize }.join(' ')
end

words = "the flintstones rock"
p titleize(words)

## 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  info["age_group"] = case info["age"]
                      when 0..17 then "kid"
                      when 18...65 then "adult"
                      else "senior"
                      end
end

p munsters
