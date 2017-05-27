# Array

> Arrays are ordered, integer-indexed collections of any object.

**Traversing:** `each`es

**Selecting elements:**

- `first`, `last`,
- `fetch(index)` (throws `KeyError`), `fetch(index, default)`
- `take(n)`
- `select { |obj| ... }`, `reject { |obj| ... }`
- `find { |obj| ... }`, `find_all { |obj| ... }`, `find_index(obj)`, `find_index { |obj| ... }`

**Adding and deleting elements:**

_Deleting elements:_

- Front: `shift` and `shift(n)`, `drop(n)`
- Back: `pop` and `pop(n)`
- Wherever: `delete(obj)` and `delete_at(index)`

Keep in mind that `n` is the number of elements, not an index.

_Adding elements:_

- Front: `unshift(obj,...)` and its alias `prepend`
- Back: `push(obj,...)` / `<<`
- Wherever: `insert(index, obj)`

**Counting elements:**

- `length` and its alias `size`
- `count`, `count(obj)`, `count { |obj| ... }`

**Transforming the array:**

- `map { |obj| ... }`
- `reduce(method_sym)`, `reduce(initial, method_sym)`
- `reduce { |memo, obj| ... }`, `reduce(initial) { |memo, obj| ... }`

Both `map` and `reduce` (and its alias `inject`) live in `Enumerable`.

**Sorting:**

- `max`, `max(n)`, `max { |a, b| ... }`
- `min`, `min(n)`, `min { |a, b| ... }`
- `sort`, `sort { |a, b| ... }`
- `sort_by { |obj| ... }`

For a collection to be sortable, the objects in the collection must implement the comparison operation `<=>`. Like `map` and `reduce`, the sorting methods live in `Enumerable`.

_Unsorting:_ `shuffle`

And many more methods for grouping, slicing, zipping, and other magic.
