
class CircularBuffer
  class BufferEmptyException < RuntimeError; end
  class BufferFullException  < RuntimeError; end

  def initialize(length)
    @buffer = []
    @size = length
  end

  def read
    raise BufferEmptyException if empty?
    @buffer.shift
  end

  def write(element)
    unless element.nil?
      raise BufferFullException if full?
      @buffer << element
    end
  end

  def write!(element)
    unless element.nil?
      @buffer.shift if full?
      @buffer << element
    end
  end

  def clear
    @buffer = []
  end

  private

  def empty?
    @buffer.empty?
  end

  def full?
    @buffer.size == @size
  end
end
