require_relative 'spaceship'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class SpaceShuttleTest < Minitest::Test
  def setup
    @spaceshuttle = SpaceShuttle.new
  end

  def teardown
  end

  def test_type
    assert(@spaceshuttle)
    assert_instance_of(SpaceShuttle, @spaceshuttle)
    assert_kind_of(SpaceVehicle, @spaceshuttle)
  end

  def test_no_naming
    assert_raises(NoMethodError) do
      @spaceshuttle.name = 'Enterprise'
    end
  end

  def test_heatshield_on
    assert_equal :on, @spaceshuttle.heatshield
  end

  def test_loading
    assert_empty @spaceshuttle.payload
    @spaceshuttle.load :lander
    assert_includes @spaceshuttle.payload, :lander
  end

  def test_launch
    assert_equal :off, @spaceshuttle.thrusters
    @spaceshuttle.launch
    assert_equal :on, @spaceshuttle.thrusters
  end

  def test_equality
    assert_equal @spaceshuttle, SpaceShuttle.new
    refute_same  @spaceshuttle, SpaceShuttle.new 
  end
end
