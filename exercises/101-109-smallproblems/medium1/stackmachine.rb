
def minilang(str)
  stack = []
  register = 0

  str.split(' ').each do |command|
    begin
      case command
      when /\d+/
        register = command.to_i
      when 'PUSH'
        stack.push register
      when 'POP'
        register = stack.pop
      when 'ADD'
        register += stack.pop
      when 'SUB'
        register -= stack.pop
      when 'MULT'
        register *= stack.pop
      when 'DIV'
        register /= stack.pop
      when 'MOD'
        register = register % stack.pop
      when 'PRINT'
        puts register
      else
        raise ArgumentError.new("'#{command}' is an invalid command.")
      end
    rescue Exception => error
      puts "Ugh oh. Something went wrong: #{error.message}"
    end
  end
  
  nil
end

## Examples

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('FNORD')

# minilang('POP DIV')
