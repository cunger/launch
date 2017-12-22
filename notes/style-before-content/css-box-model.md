# Box model 

> Every element in web design is a rectangular box.

## Box sizing

### Width and height

The total width and height of the space that a box takes up are per default additive:
* width = content `width` + left and right `padding` + `border` + left and right `margin`
* height = content `height` + top and bottom `padding` + `border` + top and bottom `margin`

![Box model](https://learn.shayhowe.com/assets/images/courses/html-css/opening-the-box-model/box-model.png)

Padding is part of an element, while the margin is not (it's space between elements). Both padding and margin are transparent. As a result, padding shows the background of the element, margin the background of its container.

Shorthands for `margin` (and, analogously, for `padding`):
```css
div {
  margin: 10px;           /* same value for all four sides */
  margin: 10px 5px;       /* top + bottom, left + right */
  margin: 10px 5px 0 6px; /* top, right, bottom, left */
}
```

### Margin collapse

Top and bottom margins collapse when they touch, i.e. adjoining margins of two elements combine to one. For two positive and two negative margins this means that the one with the greater absolute value will be used, while the other one is collapsed to 0; when one margin is negative and one is positive, both are summed up. For example:
* If one element has a bottom margin of `20px` and the element right beneath it one of `10px`, then the space between them will be `20px`.
* `25px` and `-20px` leads to `5px`.
* `-25px` and `-20px` leads to `-25px`.
Exceptions are `inline-block` and floated elements.

Left and right margins as well as paddings don't collapse.

### Borders

```css
div {
  border: 1px solid #000; /* width style color */
  /* same for individual sides with border-top, border-bottom, border-left, border-right */
}
```
And `border-radius` for rounding the corners of an element, where `border-radius: 50%` will yield a circle.

... `box-sizing` property:
* `content-box`: the default value, additive, i.e. padding and border are added to the box's width and height
* `border-box`: the padding and border are included in the box width and height (this should be used when nesting an element with width `100%` in another element, because otherwise any border or padding will make it spill out of the parent)


## Block vs inline elements

> A block-level element always starts on a new line and takes up the full width available
-- MDN

> [B]lock-level elements occupy any available width, regardless of their content, and begin on a new line. Inline-level elements occupy only the width their content requires and line up on the same line, one after the other.
-- Shay Howe

**Positioning:**
* Inline elements are placed on the same line, next to each other (until they exceed the parent's width, then they begin to wrap).
* Block elements begin a new line and are place there by themselves, thus they stack on top of each other.

**Sizing:**
* The width and height of inline elements is determined by their content (up to 100% of their parent's width, then they begin to wrap). They cannot be set to a fixed size. Top and bottom margins are ignored (while left and right margins are applied), as inline elements are horizontal. Top and bottom padding is applied, but the content above and below the inline element will not be adjusted, so if an inline element has visible borders and padding, the borders may spill into content above and below the element.
* Block elements have a default width such that width + padding + border adds up to 100%, and a default height that is necessary to accommodate their content.

**Nesting:**
* Inline elements can contain other inline elements (like `<strong><a>...</a> ...</strong>`), but no block elements (only exception: `a`).
* Block elements can contain inline as well as other block elements.

See MDN's full list of [block elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Block-level_elements#Elements) (plus `body`) and [inline elements](https://developer.mozilla.org/en-US/docs/Web/HTML/Inline_elements#Elements). Note that `img` is `inline`, and that `input` and `textarea` are `inline` in some browsers and `inline-block` in others.

This is determined by the element's `display` property. Each element has a default `display` property that can be overridden. Most common values:
* `block` (accepting all box model properties, like padding and margins)
* `inline`
* `inline-block` (are positioned like inline elements, but otherwise behave like block elements),
* `none` (the element and all elements nested inside it are hidden, i.e. the document is rendered as if the element didn't exist)
* `flex` and `grid`

The default vertical alignment of inline elements (`inline` and `inline-block`) is `vertical-align: baseline;`, other values are `middle` and `top`.
