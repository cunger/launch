
## Float

Originally intended for elements like images that text should flow around, no matter what size they have.

See: https://css-tricks.com/all-about-floats/

The `float` property removes an element from the _normal_ flow of a document, and moves it to the left or right edge of its parent element (or the page if there is no parent). It requires an element to be a block element, and will adapt its `display` value accordingly if it isn't.

Non-floated elements appearing after the floated ones will be positioned in the normal flow, ignoring the floated ones, so if you have two boxes, one floated and one non-floated, the second one might be underneath the first one. In order for the second one to behave as if the first one was in the normal flow, it has to clear the float with `clear: both | left | right`.

Note that when floating an element, order in the HTML document matters. If, for example, an image is first removed from the normal flow, then the following text will wrap around it (see https://alistapart.com/d/css-floats-101/example_h.html):
```html
<div>
  <img>
  <p>
</div>
```
But if the text is first set and the image is removed from the normal flow afterwards, it will affect the following elements but not the text (see https://alistapart.com/d/css-floats-101/example_i.html):
```html
<div>
  <p>
  <img>
</div>
```

Also note that since floated elements are not in the normal flow, they don't affect the size of their parent element. Therefore containers with only floated elements in them, collapse - as far as the container is concerned, it's empty. That's also the reason why the image in the second example sticks out of the box.

That's why it makes sense to contain floated elements in a container element (aka [_clearfix_](http://nicolasgallagher.com/micro-clearfix-hack/)), that does the clearing afterwards:
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
Or use `overflow: hidden` on the container, if it contains only floated elements and nothing else.

Floated elements without a specified width will take up as much space as their content needs.

## Position

* `position: static;` is the default and means that an element is placed within the normal flow and doesn't accept box offset properties.

* `position: relative;` (together with `left`, `right`, `top`, `bottom`)
will move the element from the original position of the element in the specified directions, while
    * preserving the space the element would have originally taken (so other elements cannot move into that space)
    * not adjusting the position of other elements - as far as the other elements are concerned, an element with a relative position is in its non-offset position  

* `position: absolute;` positions an element according to the specified box offsets relative to its closest relatively positioned parent element (or `body` if there is none). It removes the element from the normal flow, so you can put it anywhere, and it won't affect or be affected by any other elements in the flow. In particular:
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
