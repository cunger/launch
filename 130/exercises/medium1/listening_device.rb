
class ListeningDevice
  def initialize
    @recordings = []
  end

  def listen
    record yield if block_given?
  end

  def play
    puts @recordings.last unless @recordings.empty?
  end

  private

  def record(recording)
    @recordings << recording
  end
end

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ListeningTest < Minitest::Test
  def setup
    @listener = ListeningDevice.new
  end

  # Testing a private method and an instance variable without getter

  def test_recording
    assert_empty @listener.instance_variable_get('@recordings')
    @listener.send(:record, 'Hello world!')
    assert_equal ['Hello world!'], @listener.instance_variable_get('@recordings')
  end

  # Testing stdout of a method

  def test_play
    @listener.listen { 'Test test -feeeeeeep- test.' }
    @listener.listen { 'Hello world!' }
    assert_output("Hello world!\n") { @listener.play }
    assert_output(/hello/i) { @listener.play }
  end

  def test_device_is_silent_if_recordings_empty
    assert_silent { @listener.play }
  end
end
