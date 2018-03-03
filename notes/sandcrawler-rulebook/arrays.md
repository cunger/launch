# Arrays

_Arrays_ are objects where
* _elements_ are all values that have been assigned to non-negative integer keys, and
* the property `length` is 1 larger than the highest such key (it is therefore not necessarily equal to the number of elements).

Elements are accessed by `array[key]`, where `key` can be any expression, which will be evaluated and then coerced into a String. If that string does not exist among the keys, it returns `undefined`.

The `length` property can be explicitly set. Setting it to less than the current length truncates the array. Setting it to more does not create keys for the additional, non-present elements; however, empty slots will be shown when printing the array.
