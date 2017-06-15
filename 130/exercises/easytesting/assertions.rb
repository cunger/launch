require 'minitest/autorun'

class NoExperienceError < RuntimeError; end

class Employee
  def initialize
    @experience = 0
  end

  def hire
    raise NoExperienceError if @experience.zero?
  end
end

class TestExercises < Minitest::Test

  def test_value_is_odd
    value = 2
    assert value.odd?, 'value is not odd'
  end

  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end

  def test_value_is_nil
    value = nil
    assert_nil value
  end

  def test_list_is_empty
    list = []
    assert_empty list
  end

  def test_inclusion
    list = ['xyz', 1, true, {}]
    assert_includes(list, 'xyz')
    refute_includes(list, 'xyz')
  end

  def test_experience
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end

  def test_value_is_numeric
    value = 1
    assert_instance_of(Numeric, value)
    assert_kind_of(Numeric, value)
  end

  def test_same_object
    list = []
    list.define_singleton_method(:process) { [] }
    assert_same list, list.process
    assert_equal list, list.process
  end
end
