require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '../lesson1/todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)

    @empty_list = TodoList.new("empty")
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
    assert_empty(@empty_list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
    assert_equal(0, @empty_list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
    assert_nil(@empty_list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
    assert_nil(@empty_list.last)
  end

  def test_shift
    first_item = @list.shift
    assert_equal(@todo1, first_item)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    last_item = @list.pop
    assert_equal(@todo3, last_item)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute @list.done?
    @todo1.done!
    refute @list.done?
    @todo2.done!
    refute @list.done?
    @todo3.done!
    assert @list.done?
  end

  def test_adding_todos
    todo4 = Todo.new("Practise finning")
    todo5 = Todo.new("Practise darts")

    # using #add
    @list.add todo4
    assert_equal(4, @list.size)
    assert_equal(todo4, @list.last)

    # using #<<
    @list << todo5
    assert_equal(5, @list.size)
    assert_equal(todo5, @list.last)
  end

  def test_only_todos_can_be_added_to_a_todolist
    assert_raises(TypeError) { @list << "Watch Battlestar Galactica" }
    assert_raises(TypeError) { @list << 1 }
    assert_raises(TypeError) { @list << nil }

    assert_raises(TypeError) { @list.add "Watch Battlestar Galactica" }
    assert_raises(TypeError) { @list.add 1 }
    assert_raises(TypeError) { @list.add nil }
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
    assert_equal(@todo3, @list.item_at(2))
    assert_equal(@todo3, @list.item_at(-1))

    assert_raises(IndexError) { @list.item_at 3 }
  end

  def test_mark_done_at
    @list.mark_done_at 0
    assert @list[0].done?
    refute @list[1].done?
    refute @list[2].done?
    assert_raises(IndexError) { @list.mark_done_at 3 }
  end

  def test_mark_all_done
    @list.mark_all_done
    assert @list[0].done?
    assert @list[1].done?
    assert @list[2].done?
    assert @list.done?
  end

  def test_mark_undone_at
     @list.mark_all_done
     @list.mark_undone_at 0
     refute @list[0].done?
     assert @list[1].done?
     assert @list[2].done?
  end

  def test_remove_at
    @list.remove_at 0
    assert_equal(2, @list.size)
    assert_equal([@todo2, @todo3], @list.to_a)
    assert_raises(IndexError) { @list.remove_at 3 }
  end

  def test_to_s
    output = <<~OUTPUT.chomp
             ---- Today's Todos ----
             [ ] Buy milk
             [ ] Clean room
             [ ] Go to gym
             OUTPUT

    assert_equal(output, @list.to_s)

    @list.mark_done_at 1
    output = <<~OUTPUT.chomp
             ---- Today's Todos ----
             [ ] Buy milk
             [X] Clean room
             [ ] Go to gym
             OUTPUT

    assert_equal(output, @list.to_s)

    @list.mark_all_done
    output = <<~OUTPUT.chomp
             ---- Today's Todos ----
             [X] Buy milk
             [X] Clean room
             [X] Go to gym
             OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    output = @list.each { |todo| assert_instance_of(Todo, todo) }
    assert_equal(output, @list)
  end

  def test_select
    dones = @list.select { |todo| todo.done? }
    todos = @list.select { |todo| !todo.done? }
    assert_instance_of(TodoList, dones)
    assert_instance_of(TodoList, todos)
    assert_equal(0, dones.size)
    assert_equal(3, todos.size)
  end
end
