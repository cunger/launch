
# 1: 1..1000 all on
# 2: 2 * 1, 2 * 2, 2 * 3, ...
# 3: 3 * 1, 3 * 2, 3 * 3, ...
# 4: ...
# 1000: 1000 * 1

NUMBER_OF_SWITCHES = 1000

def toggle(switch)
  case switch
  when :OFF then :ON
  when :ON then :OFF
  end
end

def toggle_at!(switches, index)
  switches[index] = toggle switches[index]
end

def run(switches)
  (1..NUMBER_OF_SWITCHES).each do |round|
    (1..(NUMBER_OF_SWITCHES / round)).each do |n|
      toggle_at!(switches, (round * n) - 1)
    end
  end
end

def on_switches(switches)
  switches.each_index.select { |i| switches[i] == :ON }.map { |i| i + 1 }
end

light_bank = [:OFF] * NUMBER_OF_SWITCHES
run(light_bank)

p on_switches(light_bank)
