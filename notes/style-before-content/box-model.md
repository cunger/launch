
> Every element in web design is a rectangular box.

To get a circle: `border-radius: 50%`

## Box sizing

The actual width and height of boxes are per default additive:
= content `width` and `height` + `padding` + `border` + `margin`

![Box model](https://learn.shayhowe.com/assets/images/courses/html-css/opening-the-box-model/box-model.png)

Padding and margin are transparent -- padding shows the background of the box, margin the background of its parent element.

## Block vs inline elements

...


| Property | Allowed for | Not allowed for |
|----------|-------------|-----------------|
| `width`, `height` | `block` | `inline`, `inline-box` |
| horizontal `margin` (`left`, `right`) | all | - |
| vertical `margin` (`top`, `bottom`) | `box`, `inline-box` | `inline` |

* Inline elements cannot have a fixed width size - their width and height is always determined by their content.
* Block elements have a default width of `100%` and a default height that is necessary to accommodate their content.

## Box positioning
