# Guidelines

**Only be specific when you need to be.**

* Start with the least specific selectors, and add more specific ones only if the need arises. Very specific rules paint you a corner.
* Prefer classes over IDs, unless something is really unique, like a hook for JS.
* Prefer simple layering over nesting, for example:
```css
/* <div class="flash flash-success"> ... </div> */

.flash {
  font-size: 19px;
}

.flash-success {
  color: green;
}
.flash-error {
  color: red;
}
```

**Never rely on source order.**

**Use a reset or baseline CSS as starting point.** Otherwise each browser will present you with a different environment.

**Be expressive and clear.**

* For the sake of flexibility, the names of classes and IDs should express the purpose of the element.
> Always use semantic names. Never use presentational names.

* Also, add comments, especially for dividing the CSS file into sections that help navigate through the document.

# ...

## Backgrounds

Not all browsers support `rgba` colors (e.g. IE8), so provide a safe fallback as well.
```css
div {
  background: #b2b2b2;
  background: rgba(0, 0, 0, .3);
}
```

# Examples

### Centering content horizontally

```css
element {
  display: block;
  margin: 0 auto;
  /* usually together with max-width */
}
```

### Containing floats (aka clearfix)

```css
.group::after {
  content: "";
  display: block;
  clear: both;
}
```

```css
.group {
  overflow: auto;
  zoom: 1;
}
```

### Scaling an image when viewport gets smaller than image size

```css
img {
  max-width: 800px;
  width: 100%;
}
```

## Lists

```css
/* How to style list elements with a custom style (with fallback bullets) */
ul {
  list-style-type: disc;
  list-style-image: url("arrow.png");
}
/* or short-hand */
ul {
  list-style: disc url("arrow.png");
}

/* Alternative, with a bit more control on positioning and spaces */
ul {
  list-style: none;
}
ul li {
  background-image: url("arrow.png");
  background-repeat: no-repeat;
}

/* How to spread a list horizontally, e.g. for a nav bar */
li {
  display: inline-block;
  margin: 0 10px;
}
/* display can also be inline, e.g. to include a list into running text,
   but then no margin can be added */
```

## UI stuff

```css
/* mark required input fields more prominently than optional ones */
input {
  border: 1px solid #eee;
}
input[required] {
  border: 1px solid #000;
}
/* mark the input field that is currently edited */
input[type="text"]:focus {
  background: #e5ff89;
}
/* highlight the checked checkboxes */
input[type="checkbox"]:checked + span {
  background: #e5ff89;
}
```

## Tables

```css
/* Color alternating rows */
tr:nth-child(even) {
  background: #ccc;
}
tr:nth-child(odd) {
  background: #fff
}
```
