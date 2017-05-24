class MinilangRuntimeError < RuntimeError; end
class InvalidTokenError < MinilangRuntimeError; end
class EmptyStackError < MinilangRuntimeError; end

class Minilang
  def initialize
    reset
  end

  def eval(command)
    reset
    tokens = command.split(' ')
    tokens.each do |token|
      begin
        case token
        when /\d+/
          @register = token.to_i
        when 'PUSH'
          @stack.push @register
        when 'POP'
          @register = pop
        when 'ADD'
          @register += pop
        when 'SUB'
          @register -= pop
        when 'MULT'
          @register *= pop
        when 'DIV'
          @register /= pop
        when 'MOD'
          @register = @register % @stack.pop
        when 'PRINT'
          puts @register
        else
          raise InvalidTokenError.new("Invalid token: #{token}")
        end
      rescue Exception => error
        puts error.message
      end
    end
  end

  private

  def reset
    @stack = []
    @register = 0
  end

  def pop
    raise EmptyStackError.new if @stack.empty?
    @stack.pop
  end
end

## Tests

stackmachine = Minilang.new

stackmachine.eval 'PRINT'
# 0

stackmachine.eval '5 PUSH 3 MULT PRINT'
# 15

stackmachine.eval '5 PRINT PUSH 3 PRINT ADD PRINT'
# 5
# 3
# 8

stackmachine.eval '5 PUSH 10 PRINT POP PRINT'
# 10
# 5

stackmachine.eval '5 PUSH POP POP PRINT'
# Empty stack!

stackmachine.eval '3 PUSH PUSH 7 DIV MULT PRINT '
# 6

stackmachine.eval '4 PUSH PUSH 7 MOD MULT PRINT '
# 12

stackmachine.eval '-3 PUSH 5 XSUB PRINT'
# Invalid token: XSUB

stackmachine.eval '-3 PUSH 5 SUB PRINT'
# 8

stackmachine.eval '6 PUSH'
# (nothing printed; no PRINT commands)
