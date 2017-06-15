require_relative 'spaceship'

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class SpaceShuttleTest < Minitest::Test

  describe 'Space Shuttle' do

    before do
      @spaceshuttle = SpaceShuttle.new
    end

    it 'is a Space Vehicle' do
      @spaceshuttle.must_be_kind_of SpaceVehicle
    end

    it 'implements value equality' do
      @spaceshuttle.must_equal SpaceShuttle.new
    end

    it 'cannot be given a name' do
      proc { @spaceshuttle.name }.must_raise  NoMethodError
    end

    describe 'heat shield' do

      it 'is activated' do
        @spaceshuttle.heatshield.must_equal :on
      end
    end

    describe 'payload' do

      it 'is initially empty' do
        @spaceshuttle.payload.must_be_empty
      end

      it 'can take on whatever stuff' do
        @spaceshuttle.load :lander
        @spaceshuttle.payload.must_include :lander
      end
    end

    describe 'thrusters' do

      it 'is initially off' do
        @spaceshuttle.thrusters.must_equal :off
      end

      it 'is activated during launch' do
        @spaceshuttle.launch
        @spaceshuttle.thrusters.must_equal :on
      end
    end
  end
end
