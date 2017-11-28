
## Selectors

CSS selectors specify which HTML elements are styled.

* **Type selectors** select elements by their element type.
```
p { ... }
```
* **Class selectors** select elements based on the element's attribute value.
```
.awesome {...}
```
* **ID selectors** target a unique element with a specific ID attribute value.
```
#justme {...}
```

Combining selectors:

```css
/* targets elements of type p with class=hotdog or class=burger */
p.hotdog,
p.burger {
  ...
}
```

Nesting selectors:
```css
/* targets elements with class=mustard within elements with class=hotdog */
.hotdog .mustard {
  ...
}

/* targets elements with class=ketchup within elements with class=hotdog */
.hotdog .ketchup {
  ...
}
```

Spaces matter!
* `p.mustard` selects all `p` elements with `class="mustard"`
* `p .mustard` selects all elements that are of type `p` or have `class="mustard"` (independent of their type)

### Cascade

The cascade determines which properties apply to which elements. It allows styles to be added and overriden.

CSS uses the following three concepts (in that order) to determine which rule takes precedence:
* _importance_
  user agent (aka browser) < user < author < author `!important` declarations < user `!important` declarations (e.g. in order to override properties like font-size that would otherwise hamper the accessibility)
* _specificity_:
  type `0-0-1` < class `0-1-0` < ID `1-0-0`
* _source order_
  if all else is equal, the rule later in the source code is applied

**Inheritance:** ...
Font and color properties are inherited, while most others (e.g. box-related ones) are not.

## ... and Units

### Colors

* keyword (`black`, `white`, `gray`, `silver`, `maroon`, etc., see [MDN > color-value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value))
* hexadecimal: RGB #rrggbb ( or #rgb)
where r,g,b = [1..9a..f]
with 0 black and f white
-> 16.7+ mio colors = (16^2)^3
* rgb(0, 255, 0) with 0 black and 255 white
rgba(0, 255, 0, 0.5) with the last value being an alpha channel,  0 fully transparent,  1 fully opaque

### Lengths

**Absolute:**
* `px`
> A CSS reference pixel has an angular width of a physical pixel on a device that displays 96 pixels per inch, adjusted for some typical viewing distance appropriate for the device.

**Relative:**
* `1em` represents the calculated font-size of the element, so `2em` is twice the font-size of the element (if `em` is used to specify `font-size`, `1em` corresponds to the inherited font-size of the element) - note that `em`s compound when elements are nested
* `1rem` represents the calculated font-size of the root element
* `1vh` and `1vw` represent 1% of the viewport's height and width, respectively (not universally supported, though) - e.g. useful for _viewport sized typography_:
```css
h1 { font-size: 20vw; }
p  { font-size: 2vmin; }
```
* `%` relates to the length of the same property of the parent element; note that for paddings and margins it always relates to the element's width

Use fallbacks when using units that are not universally supported, e.g.:
```css
p {
  font-size: 20px; font-size: 1.25rem;
}
nav {
  width: 25%; width: 25vw;
}
```

Default is `auto` that "determines an appropriate length based on the content and the element's content".

## Comments

```
/* ... */
```

## Pseudo classes and elements

> A CSS pseudo-class is a keyword added to a selector that specifies a special state of the selected element.
-- [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/pseudo-classes)

e.g. `a:hover`, `a:visited`, `button:checked`

> A CSS pseudo-element is a keyword added to a selector that lets you style a specific part of the selected element.
-- [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements)

e.g. `div::before`, `div::after` (which create a pseudo-element that is the first/last child of the `div`)
