# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done?
    done
  end

  def done!
    self.done = true
  end

  def todo!
    self.done = false
  end

  def to_s
    "[#{done? ? 'X' : ' '}] #{title}"
  end
end

# todo1 = Todo.new('Water the plants')
# todo2 = Todo.new('Learn web dev')
#
# todo1.done!
#
# puts todo1
# puts todo2
