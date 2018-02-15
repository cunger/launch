
## Selectors

CSS selectors specify which HTML elements are styled.

* **Type selectors** select elements by their element type.
```css
/* <p>...</p> */
p { ... }
```
* **Class selectors** select elements based on the element's attribute value.
```css
/* <div class="awesome">...</div> */
.awesome {...}
```
* **ID selectors** target a unique element with a specific ID attribute value.
```css
/* <div id="justme">...</div> */
#justme {...}
```

Combining selectors:

```css
/* targets elements of type p with class="hotdog" or class="burger" */
p.hotdog,
p.burger {
  ...
}
```

Spaces matter!
* `p.mustard` selects all `p` elements with `class="mustard"`
* `p .mustard` selects all elements that are of type `p` or have `class="mustard"` (independent of their type)

### Descendant selectors

```css
/* Any descendant */
header a { ... } /* (targets elements of type a within elements of type header) */

/* Direct child */
header > a { ... } /* (targets elements of type a that are direct children of elements of type header) */

/* Sibling */
header ~ p { ... } /* (targets elements of type p that are siblings of elements of type header) */
/* Adjacent sibling */
header + p { ... }
/* Note that these selectors select p siblings following the header element,
   but do not select p elements preceding it. */
```

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

/* Combination: targets links of form http://.../folder/...pdf */
a[href^="http://"][href*="/folder/"][href$=".pdf"]

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
* _importance_, in increasing order:
    * user agent (e.g. browser)
    * user (e.g. changed default font-size in browser)  
    * author (e.g. imported CSS file)
    * author `!important` declarations
    * user `!important` declarations (most important, so that the user is always able to override properties that would otherwise hamper the accessibility)
* _specificity_, in increasing order:
    * elements, pseudo-elements `0-0-1`
    * class, pseudo-class, attribute `0-1-0`
    * ID `1-0-0`
    * inline styles
  The universal selector `*` has a specificity of `0-0-0`.
* _source order_:
  if all else is equal, the rule later in the source code is applied

Since the specificity of anchor classes is the same for all of them, their order determines which one is applied last. That's why they should be specified in the following order:  
```css
a:link
a:visited
a:hover
a:active
```

## Inheritance

Font and color properties are inherited, while most others (especially box-related properties) are not.

## Pseudo classes and elements

> A CSS pseudo-class is a keyword added to a selector that specifies a special state of the selected element.
-- [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/pseudo-classes)

Examples:
* `a:hover`, `a:active`, `a:visited`
* `input:focuse`, `input:disabled`, `input:checked`
* `li:first-child`, `li:last-child` (selecting the `li` element that is the first/last child)
* `td:first-of-type`, `td:last-of-type`
* `section:target` (targets all `section` elements that have an ID attribute value that is part of a URL fragment, e.g. anchors on a page, like `<section id="here"`, that are referenced like `<a href="#here">` or `<a href="https://example.com#here">`)
* `div:empty`
* `p:not(.intro)`, `:not(div)`

> A pseudo element is one that does not exist in the actual HTML, but the browser will insert it after the initial page rendering

> A CSS pseudo-element is a keyword added to a selector that lets you style a specific part of the selected element.
-- [MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-elements)

Examples:
* `div::before`, `div::after` (which create an inline pseudo-element that is the first/last child of the `div`)
* `p::first-line`

It needs to have `content` defined in order to be rendered, even if only `content: "";`.
Also, pseudo-elements don't work on replace elements (e.g. `img` and form elements, such as `input`, `button`, `textarea`, `select`).

`:n-th*(...)` pseudo elements allow for specifying a counter using the variable `n`, which will count up (i.e. `0, 1, 2, ...`), or `-n`, which will count down (i.e. `0, -1, -2, ...`). Examples:

```css
element:n-th*(2n)   /* = element:n-th*(even)  */
element:n-th*(2n+1) /* = element:n-th*(odd)  */
element:n-th*(-n+2) /* selects the first two elements (n => 2, 1, 0, -1, -2, ...) */
```


## Colors

* keyword (`black`, `white`, `gray`, `silver`, `maroon`, etc., see [MDN > color-value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value))
* hexadecimal: RGB `#rrggbb` (or `#rgb`)
where `r,g,b = [1..9a..f]`
with `0` black and `f` white
(this yields (16^2)^3 = 16.7+ million colors)
* `rgb(0, 255, 0)` with `0` black and `255` white, and
`rgba(0, 255, 0, 0.5)` where the last value is an alpha channel with `0` fully transparent and `1` fully opaque

## Lengths

**Absolute:**
* `px`
> A CSS reference pixel has an angular width of a physical pixel on a device that displays 96 pixels per inch, adjusted for some typical viewing distance appropriate for the device.

**Relative:**
* `1em` represents the calculated font-size of the element, so `2em` is twice the font-size of the element (if `em` is used to specify `font-size`, `1em` corresponds to the inherited font-size of the element) - note that `em`s compound when elements are nested
* `1rem` represents the calculated font-size of the root element
* `1vh` and `1vw` represent 1% of the viewport's height and width, respectively (not universally supported, though), and is, e.g., useful for _viewport sized typography_:
```css
h1 { font-size: 20vw; }
p  { font-size: 2vmin; }
```
* `%` relates to the length of the same property of the parent element (for paddings and margins it always relates to the element's width)

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

```css
/* ... */
```
