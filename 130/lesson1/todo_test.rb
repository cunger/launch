require_relative 'todo'
require_relative 'todolist'

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list

puts list

list.each do |todo|
  puts todo                     # calls Todo#to_s
end

p list.select { |todo| todo.done? }
p list.select { |todo| !todo.done? }

list.each { |todo| todo.done! }

puts list

# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
puts list.size                       # returns 3

# first
puts list.first                      # returns todo1, which is the first item in the list

# last
puts list.last                       # returns todo3, which is the last item in the list

# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
list.item_at(1)                   # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(0)
list.mark_done_at(1)              # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)            # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

puts list

# ---- Deleting from the the list -----

# shift
puts list.shift                      # removes and returns the first item in list

# pop
puts list.pop                        # removes and returns the last item in list

puts list

# remove_at
# list.remove_at                  # raises ArgumentError
list.remove_at(0)                 # removes and returns the 2nd item
# list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

list << todo1
list << todo2
list << todo3

# to_s
puts list.to_s

p list.find_by_title('go to gym')
p list.find_by_title('Climb mountain')

list.mark_all_done
puts list
list.mark_all_todo
puts list
