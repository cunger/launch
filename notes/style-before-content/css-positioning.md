
## Float

The `float` property _removes an element from the normal flow of a document_, and moves it to the left or right edge of its parent element (or the page if there is not parent). It requires an element to be a block element, and will adapt its `display` value accordingly if it isn't.

Removing an element from the normal flow of a document can break the layout. For example, floating allows all elements around the floated element to wrap and consume any available space around the floated element. In order to return to the normal flow, either clear floats on an element after the floated ones:
```css
div {
  clear: both; /* | left | right */
}
```
or contain the floated elements in a container element (aka [_clearfix_](http://nicolasgallagher.com/micro-clearfix-hack/)) that does the clearing:
```css
.group::before,
.group::after {
  content: "";
  display: table;
}
.group::after {
  clear: both;
}
/* where class="group" can now be used on any parent element containing floats */
```

## Position

* Default: `position: static;`
Which means that an element is placed within the normal flow and doesn't accept box offset properties.

* `position: relative;` (together with `left`, `right`, `top`, `bottom`)
will move the element from the original position of the element in the specified directions, while
    * preserving the space the element would have originally taken (so other elements cannot move into that space)
    * not adjusting the position of other elements (so if there is another element in that direction, it will be overlapped)

* `position: absolute;` positions an element according to the specified box offsets relative to its closest relatively positioned parent element (or `body` if there is none). It removes the element from the normal flow, so
    * its original position and space are not preserved
    * other elements are not affected, so the positioned element might overlap them
`position: fixed;` works the same but with respect to the viewport and not a parent element. E.g., an offset of `top: 0; left: 0; right: 0;` gives a fixed header.

## Others

For horizontal alignment of elements, changing them to `inline-block`s is usually sufficient. Use floats only when content is supposed to wrap around an element.  

**Also see:** `flex` and `grid` properties
