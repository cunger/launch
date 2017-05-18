require 'set'

class Pet
  attr_reader :kind, :name

  def initialize(kind, name)
    @kind = kind
    @name = name
  end

  def to_s
    "a #{kind} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = Set.new
  end

  def <<(pet)
    @pets << pet
  end

  def number_of_pets
    @pets.size
  end
end

class Shelter
  def initialize
    @pets = {}
  end

  def <<(pet)
    @pets[pet] = nil
  end

  def adopt(owner, pet)
    owner << pet
    @pets[pet] = owner
  end

  def print_adoptions
    @pets.values.uniq.each do |owner|
      next if owner.nil?
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each { |pet| puts pet }
    end
  end

  def print_unadopted
    puts "The Animal Shelter has the following unadopted pets:"
    unadopted = @pets.select { |pet, owner| owner.nil? }
    unadopted.each_key { |pet| puts pet }
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
fluffy       = Pet.new('dog', 'Fluffy')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new

shelter << butterscotch
shelter << pudding
shelter << darwin
shelter << kennedy
shelter << sweetie
shelter << molly
shelter << chester
shelter << asta
shelter << fluffy
shelter << bluebell

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
shelter.print_unadopted

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
