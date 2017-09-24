
# HTML forms

When a form is submitted, the browser sends an HTTP request to the path specified in the `action` attribute, with the method specified in the `method` attribute (GET or POST). The values of all `input` elements in the form will be sent as parameters (with `name` as key): for GET requests as query parameters within the URL, for POST requests as key/value pairs in the request body.

**Examples:**

```
<form method="POST" action="/login">
Username: <input type="text" name="username">
Password: <input type="text" name="password">
<button type="submit">Log in</button>
</form>
```

```
<form method="GET" action="/search">
Search term: <input type="text" name="query">
<button type="submit">Search</button>
</form>
```
