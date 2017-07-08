
# class Class
#   def to_proc
#     proc { |args| new(*args) }
#   end
# end

class SpiceGirl
  def initialize(name, nick)
    @name = name
    @nick = nick
  end

  def inspect
    "#{@name} (#{@nick} Spice)"
  end

  def self.to_proc
    proc { |args| new(*args) }
  end
end

spice_girls = [["Mel B", "Scary"], ["Mel C", "Sporty"],
["Emma B", "Baby"], ["Geri H", "Ginger",], ["Vic B", "Posh"]]

p spice_girls.map(&SpiceGirl)

# * * * * * * * * * * * * * * * *

def calling(p)
  p.call
end

def defining
  p = proc { return 42 }

  puts 'Go!'
  calling(p)
  puts 'Done.'
end

# > defining
# Go!
# => 42

def meditate
  puts 'Adjusting posture...'
  p = Proc.new do
        puts 'Ringing bell...'
        next
        puts 'Getting distracted!'
      end
   p.call
   puts 'Sitting still...'
end

# * * * * * * * * * * * * * * * *

var = 1
p = proc { puts "var = #{var}" } # NameError if var is no yet defined at this point
p.call

var = 2
p.call

# * * * * * * * * * * * * * * * *

def call_on_each(*args)
  args.each { |arg| yield arg }
end
