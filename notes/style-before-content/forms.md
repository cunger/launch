```html
<form action="url" method="post">
  ...
</form>
```
Information included in the form will be sent to `url` (usually `/path`, but can be an absolute URL as well) by means of GET or POST as specified by `method`.

## What's in a form

* **Input fields** with **labels** that tell the user what the input field is about
* **Actions**, e.g. buttons for submitting the form or for _Save_, _Back_, _Cancel_, etc.
* **Messages** that
    * provide help in filling out the form (e.g. why some input is required or what is going to be done with it)
    * give feedback on user input
* **Validation** of user input

## Input fields and labels

For a comprehensive guide on widgets: https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/The_native_form_widgets

Single-line text input:

```html
<label>
  User name
  <input type="text" name="username">
</label>

<!-- Or, more explicitly and thus safer for screen reading:  -->
<label for="username">User name</label>
<input type="text" name="username">
```
HTML provides a range of types, including for example:
* `date`, `time`, `datetime`
* `number`
* `email`
* `url`
If a browser does not know the type, it falls back to `text`.

Other types with specific rendering:
* multiple choice: `radio`, `checklist`
* `file`
* `submit`
* `hidden`

Useful attributes:
* `placeholder`
```html
<input type="email" name="email-address" placeholder="name@domain.com">
```
* `required`
* `autofocus`

Larger text input:

```html
<textarea name="the-contents-purpose">Default text to be shown</textarea>
```

### Structuring

Organizing form elements with `fieldset`.
Example:

```html
<fieldset>
  <legend>Login</legend>

  <label>
    Username
    <input type="text" name="username">
  </label>
  <label>
    Password
    <input type="text" name="password">
  </label>
</fieldset>
```

The `legend` element is essential for screen readers, so it should be included even when hidden from display.

## Actions

Sending the form data:
```html
<input type="submit" value="plain text">

<button type="submit">full HTML content</button>
```

Data gets sent as _name-value pairs_, where _name_ is the value of the `name` attribute
and _value_ is what the user entered or selected.

The `id` attribute, on the other hand side, is used for uniquely identifying elements in the DOM tree.

```html
<input id="button_1" type="radio" name="option" />
<input id="button_2" type="radio" name="option" />
```
