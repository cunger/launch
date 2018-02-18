## What's in a form

* **Input fields** with **labels** that tell the user what the input field is about
* **Actions**, e.g. buttons for submitting the form or for _Save_, _Back_, _Cancel_, etc.
* **Messages** that
    * provide help in filling out the form (e.g. why some input is required or what is going to be done with it)
    * give feedback on user input
* **Validation** of user input

## Actions

```html
<form action="url" method="post">
  ...
</form>
```
Information included in the form will be sent to `url` (usually `/path`, but can be an absolute URL as well) by means of GET or POST as specified by `method`.

Sending the form data can be triggered by `input` and `button` elements. For example:
```html
<input type="submit" value="button text here (only plain text)">
```
```html
<button type="submit">button text (full HTML content) here</button>
```

Data gets sent as _name-value pairs_, where _name_ is the value of the `name` attribute
and _value_ is what the user entered or selected.
The `id` attribute, on the other hand side, is used for uniquely identifying elements in the DOM tree.

Actions differing from the one set in `form` (i.e. other paths to which the form information will be sent) can be assigned to specific buttons by means of the `formaction` attribute. For example:
```html
<form action="/login" method="post">
  ...
  <div class="actions">
    <input  type="submit" value="Login" />
    <button type="submit" formaction="/account/delete">Delete account</button>
    <button type="submit" formaction="/account/password_reset">Reset password</button>
  </div>
</form>
```

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
<input type="text" name="username" id="username">
```
Note that `for` requires an `id` value as value (not a `name`).

HTML provides a range of types, including for example:
* `date`, `time`, `datetime`
* `number`
* `email`
* `url`
If a browser does not know the type, it falls back to `text`.
If you want to disable the autocompletion function, set `autocomplete="off"` within the element. And if you don't want the browser to validate the input, add `novalidate`. For example:
```html
<label for="email">Email:</label>
<input type="email" id="email" name="email" autocomplete="off" novalidate>
```
* `file`
* choice: `radio`, `checkbox`, `select` (aka drop-down)
```html
<input id="option1" type="radio" name="taste" value="Chocolate">
<input id="option2" type="radio" name="taste" value="Vanilla">
```
Radio buttons allow exactly one choice, which will be sent to the server as value (more specifically, the value of `value` will be sent, e.g. `taste=Vanilla`; if that doesn't exist, the button text will be sent). While checkbox buttons allow no, some and all options to be selected, where each selected option will be sent to the server with value `"on"`. For drop-downs, the boolean attribute `multiple` decides whether multiple choices are allowed.
* `submit`
* `hidden`

Useful attributes:
* `placeholder`
```html
<input type="email" name="email-address" placeholder="name@domain.com">
```
* `required`
* `autofocus`
* `disabled` will render the element but prevent the user from interacting with it

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
