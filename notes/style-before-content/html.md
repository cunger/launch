
HTML specifies content, i.e. information and structure, while CSS specifies the appearance of that content.

The basic building block in HTML is the _element_. The root element is `html`.

> Every element in web design is a rectangular box.

Semantic elements means using elements that describe the type of content and structure, independent of their appearance. For example:

* `strong` for marking an element as important
* `em` for emphasizing an element (e.g. `We have to act <em>now</em>!`)
* `i` to stylistically offset text, e.g. for alternative voice, or for names and terms (`<i class="taxonomy">Diplodocus</i>`) as well as transliterated foreign words (`<i lang="ja-latn">udon</i> noodles`)
* `b` to draw attention to an element, without marking it as important

### Structural elements

* `header`, `main`, `footer`
* `nav` for an element with navigational links
* `aside` (e.g. for side bars, or additional explanations)
* `section` (for grouping content)
* `article` (for content that could be distributed independent of the rest of the site, e.g. blog posts)

## Block vs inline elements

Block elements begin on a new line, thus stacking on top of each other, and can have any width.

Inline elements don't begin on a new line, they line up and take up only the width of their content.

Containers for creating elements without any further semantics (for grouping and styling purposes):
* `div`  for block elements
* `span` for inline elements

Inline elements are not allowed to wrap block elements, with one exception: `a`.

## Attributes and anchors

Each HTML element can have a `class` attribute and an `id` attribute.

IDs can serves as _anchors_ for links to elements on the same page:
```html
<body id="top">
  ...
  <section id="section1">
    ...
  </section>
  ...
  <a href="#section1">Back to Section 1</a>
  <a href="#top">Back to top</a>
</body>
```

## Comments

```html
<!-- ... -->
```
