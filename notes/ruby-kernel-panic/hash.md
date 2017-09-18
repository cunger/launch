# Hash

> A Hash is a dictionary-like collection of unique keys and their values. [...] they are similar to Arrays, but where an Array uses integers as its index, a Hash allows you to use any object type.

**Traversing:** `each`es

**Accessing elements:**
- `keys`, `values`
- `fetch(key)` (throws `KeyError`), `fetch(key, default)`
- `key(value)`
- `select { |key, value| ... }`
- `reject { |key, value| ... }`

**Counting elements:**

- `length` and its alias `size`
- `count`, `count([key, value])`, `count { |key, value| ... }`

**Adding and deleting elements:**

- `delete(key)`
- `delete_if { |key, value| ... }`
- its opposite `keep_if { |key, value| ... }` which deletes every key-value pair except for the ones for which the block evaluates to true
- `update(other_hash)` and the equivalent `merge(other_hash)`

When merging, the values of duplicate keys will be overwritten. In case you don't want this to happen, you can provide a block that specifies what to do:
`update(other_hash) { |key, old_value, new_value| ... }`

**Transforming the hash:**

- `invert` to swap keys and values (overwrites information if the mapping is not 1–1)
- `map { |key, value| ... }` and the different forms of `reduce` (both from `Enumerable`), as well as the more specific `transform_values { |value| ... }`
