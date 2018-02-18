
## Markup

* Link logo to home.
* Put logo in an `h1` only if appropriate. `h1`s should contain the title of the page (i.e. what that particular page is about).
* Put `img` in a `figure` if appropriate.
* When an image doesn't carry any semantics, it's best placed as `no-repeat` background image.
* Add `time` tag to dates and date times.
* Use proper types on each `input`.

## Styling

* When you have a background image (e.g. in a header), specify a suitable background color as well, so text will be visible also when the image is not loaded.

* Since the specificity of the following anchor selectors is the same for all of them, source code order matters and should be:
```css
a:link
a:visited
a:hover
a:active
```
