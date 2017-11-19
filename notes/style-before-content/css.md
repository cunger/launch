HTML = content (information + structure)
CSS = appearance of that content

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

Combining them:
```
element.class,
element.class {
  ...
}

element#id {
  ...
}
```

### Cascade

The cascade determines which properties apply to which elements. It uses the following three concepts in that order to determine which rule takes precedence:
* _importance_
  user agent aka browser < user < author < author `!important` declarations < user `!important` declarations (e.g. in order to override properties like font-size that would otherwise hamper the accessibility)
* _specificity_, calculation examples: https://stuffandnonsense.co.uk/archives/images/specificitywars-05v2.jpg
  first important rule: type < class < ID
* _source order_
  if all else is equal, the later rule is applied

**Inheritance:** ...
Font and color properties are inherited, while most others (e.g. box-related ones) are not.

## Colors

* keyword (`black`, `white`, `gray`, `silver`, `maroon`, etc., see [MDN > color-value](https://developer.mozilla.org/en-US/docs/Web/CSS/color_value))
* hexadecimal: RGB #rrggbb ( or #rgb)
where r,g,b = [1..9a..f]
with 0 black and f white
-> 16.7+ mio colors = (16^2)^3
* rgb(0, 255, 0) with 0 black and 255 white
rgba(0, 255, 0, 0.5) with the last value being an alpha channel,  0 fully transparent,  1 fully opaque

## Comments

```
/* ... */
```

# Guidelines

**Only be specific when you need to be.**

Start with the least specific selectors, and add more specific ones only if the need arises. Very specific rules paint you a corner.
Prefer classes over IDs, unless something is really unique, like a hook for JS.

**Never rely on source order.**

**Use a reset or baseline CSS as starting point.** Otherwise each browser will present you with a different environment.

**Be expressive and clear.**

For the sake of flexibility, the names of classes and IDs should express the purpose of the element.
> Always use semantic names. Never use presentational names.

Also, add comments, especially for dividing the CSS file into sections that help navigate through the document.
