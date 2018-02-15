
_Mobile first:_ Write CSS for mobile version and use media queries to add rules (and images, etc.) for larger screens. This way, load time and bandwidth use on mobile devices can be minimized.

## Importing CSS with media queries

HTML:
```html
<link href="file.css" rel="stylesheet" media="media-query">
```

CSS:
```css
@import url('file.css') media-query;

@media media-query {
  ...
}
```

## Syntax

```
media-query := (logic)? media and (media features)

logic := only | not
media := screen | projection | print | ...

media features := feature
                | feature : value
```

Features include, among others, **device orientation**:
```
orientation : portrait | landscape
```
and **width**:
```
           width: 600px;
       min-width: 400px;
       max-width: 800px;

    device-width: 600px;
min-device-width: 400px;
max-device-width: 800px;
```

Where `width` refers to the width of the viewport, and `device-width` refers to the width of the screen (independent of device orientation).
And analogously for `height`.

**Example:**

```css
/* Include background image only if the viewport provides enough space */

@media screen and (min-width: 400px) {
  h1 {
    background: url('large-image.jpg');
  }
}
```

Expressions can be composed with `and` and `,` (meaning or). For example:  

```css
/* screen that has (a min-width of 400px or orientation landscape) and a max-width of 800px */
@media screen and (min-width: 400px, orientation: landscape) and (max-width: 800px) {
}
```
