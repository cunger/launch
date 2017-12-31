# Positioning

For floats, see [CSS floats](css-float.md).

## Position

* `position: static;` is the default and means that an element is placed within the normal flow and doesn't accept box offset properties. All elements with a value different from `static` are said to be _positioned_, while a static element is not positioned.

* `position: relative;` (together with `left`, `right`, `top`, `bottom`)
will move the element from the original position of the element in the specified directions, while
    * preserving the space the element would have originally taken (so other elements cannot move into that space)
    * not adjusting the position of other elements - as far as the other elements are concerned, an element with a relative position is in its non-offset position  
  Without any of the properties `left`, `right`, `top`, `bottom`, a relatively positioned element is placed exactly like a static one.

* `position: absolute;` positions an element according to the specified box offsets relative to its closest positioned ancestor element (or `body` if there is none). It removes the element from the normal flow, so you can put it anywhere, and it won't affect or be affected by any other elements in the flow. In particular:
    * its original position and space are not preserved
    * other elements are not affected, so the positioned element might overlap them

* `position: fixed;` works the same as `absolute` but with respect to the viewport and not a parent element. E.g., an offset of `top: 0; left: 0; right: 0;` gives a fixed header. (Note that support in older browsers is not great.)

In order to center an `absolute` or `fixed` element:
```css
#element {
  width: 200px;
  position: absolute;
  top: 0;
  /* move the left offset to the center, and then move it back by the width of the element */
  left: 50%;
  margin-left: -200px;
}
```

## Others

For horizontal alignment of elements, changing them to `inline-block`s is usually sufficient. Use floats only when content is supposed to wrap around an element.  

**Also see:** `flex` and `grid` properties

## Overflow

The `overflow` property specifies what happens when an element has a fixed size and the content doesn't fit into it.
* `visible` (the default) renders the content, which then flows outside of the box (but without affecting other elements)
* `hidden` hides any content that extends beyond the box (and self-clears all floats in the element)
* `scroll` and `auto` make the overflowing content accessible via scrollbars, where `auto` shows them only when they are necessary, while `scroll` always shows them (independent of whether they are needed).
