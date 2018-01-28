
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

### Descendant selectors

```css
/* Any descendant
  (targets elements of type a within elements of type header) */
header a { ... }

/* Direct child
  (targets elements of type a that are direct children of elements of type header) */
header > a { ... }

/* Sibling
  (targets elements of type p that are siblings of elements of type header) */
header ~ p { ... }
/* Adjacent sibling */
header + p { ... }
```

Spaces matter!
* `p.mustard` selects all `p` elements with `class="mustard"`
* `p .mustard` selects all elements that are of type `p` or have `class="mustard"` (independent of their type)

### Attribute selectors

```css
/* Element with attribute present, regardless of the value */
a[target] { ... }
/* Element with attribute with a particular value */
a[href="#"] { ... }
/* Element with attribute value containing a given value */
a[href*="login"] { ... }
/* Element with attribute value starting with a given value */
a[href^="https://"] { ... }
/* Element with attribute value ending with a given value */
a[href$=".pdf"] { ... }

/* Element with one of space-separated attribute values matching */
div[role~="tag"] { ... }
/* e.g. matches <div role="tag button"> */

/* Element with one part of a hyphenated value matching */
div[lang|="en"]
/* e.g. matches <div lang="en-US"> */
```

## The cascade

The cascade determines which properties apply to which elements. It allows styles to be added and overriden.

CSS uses the following three concepts (in that order) to determine which rule takes precedence:
* _importance_
  user agent (aka browser) < user < author < author `!important` declarations < user `!important` declarations (e.g. in order to override properties like font-size that would otherwise hamper the accessibility)
* _specificity_:
  elements, pseudo-elements `0-0-1` < class, pseudo-class, attribute `0-1-0` < ID `1-0-0` < inline styles
  (and the universal selector `*` has a specificity of `0-0-0`)
* _source order_
  if all else is equal, the rule later in the source code is applied

Since the specificity of anchor classes is the same for all of them, their order determines which one is applied last. That's why they should be specified in the following order:  
```css
a:link
a:visited
a:hover
a:active
```

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

Examples:
* `a:hover`, `a:active`, `a:visited`
* `input:focuse`, `input:disabled`, `input:checked`
* `li:first-child`, `li:last-child` (selecting the `li` element that is the first/last child)
* `bento:first-of-type`, `bento:last-of-type`
* `bento:empty`
* `section:target` (targets all `section` elements that have an ID attribute value that is part of a URL fragment, e.g. anchors on a page, like `<section id="here"`, that are referenced like `<a href="#here">` or `<a href="https://example.com#here">`)
* `div:empty`
* `p:not(.intro)`, `:not(div)`

> A CSS pseudo-element is a keyword added to a selector that lets you style a specific part of the selected element.
-- [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements)

> A pseudo element is one that does not exist in the actual HTML, but the browser will insert it after the initial page rendering

Examples:
* `div::before`, `div::after` (which create an inline pseudo-element that is the first/last child of the `div`)
* `p::first-line`

It needs to have `content` defined in order to be rendered, even if only `content: "";`.
