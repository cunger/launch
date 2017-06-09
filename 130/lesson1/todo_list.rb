require_relative 'todo'

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.is_a? Todo
    @todos << todo
  end
  alias_method :add, :<<

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos[index]
  end

  def mark_done_at(index)
    @todos.fetch(index).done!
  end

  def mark_undone_at(index)
    @todos.fetch(index).todo!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    raise IndexError unless (0...@todos.size).cover? index.abs
    @todos.delete_at(index)
  end

  def each
    @todos.each { |todo| yield todo }
    self
  end

  def select
    # @todos.select { |todo| yield todo }
    list = TodoList.new(title)
    each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  def find_by_title(str)
    # select { |todo| todo.title == str }.first
    each do |todo|
      return todo if todo.title == str
    end
    nil
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_todo
    select { |todo| !todo.done? }
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_todo
    each { |todo| todo.todo! }
  end

  def mark_done(str)
    todo = find_by_title(str)
    todo.done! if todo
    # each do |todo|
    #   if todo.title == str
    #     todo.done!
    #     break
    #   end
    # end
  end

  def to_s
    (["---- #{title} ----"] + @todos).join("\n")
  end
end
