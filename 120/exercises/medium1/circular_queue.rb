class CircularQueue
  def initialize(size)
    @buffer = [nil] * size
    @oldest = 0
    @next   = 0
  end

  def enqueue(element)
    @oldest = move(@oldest) unless @buffer[@next].nil?
    @buffer[@next] = element
    @next = move(@next)
    element
  end

  def dequeue
    element = @buffer[@oldest]
    @buffer[@oldest] = nil
    @oldest = move(@oldest) unless element.nil?
    element
  end

  private

  def move(index)
    index += 1
    index -= @buffer.size if index >= @buffer.size
    index
  end
end

## Tests

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
