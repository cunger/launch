### Centering content

```css
/* Put element in a container */
.container {
  text-align: center;
}

/* or set left and right margins to auto */
element {
  display: block;
  margin: 0 auto;
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
