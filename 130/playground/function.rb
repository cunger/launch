class Function
  def initialize(&block)
    @fun = block.curry
  end

  def call(*args)
     @fun = @fun.call *args
     @fun.is_a?(Proc) ? self : @fun
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class FunctionTest < Minitest::Test
  def setup
    @plus = Function.new { |x, y| x + y }
  end

  def test_partial_application_returns_function
    assert_instance_of(Function, @plus.call(1))
  end

  def test_arguments_can_be_supplied_at_once
    assert_equal(3, @plus.call(1, 2))
  end

  def test_arguments_can_be_supplied_one_after_the_other
    assert_equal(3, @plus.call(1).call(2))
  end
end
