
## Expressions and statements

The two major syntactic categories in JavaScript are _expressions_ and _statements_. A programs is a sequence of statements. Statements _do stuff_: they declare variables or functions, assign a value to a variable, define a conditional loop, evaluate an expression, and so on. Expressions produce a value.

Functions can be defined by means of a function declaration statement:
```js
function f() {
  // ...
}
```
Or by means of an expression of the form `(function f() { ... })`. The latter can again occur everywhere an expression can occur, and allows for defining anonymous, i.e. unnamed, functions (`function () { ... }`).

## Conditional loops

### _If-then-else_ statement

```js
if {
  // ...
} else {
  // ...
}
```
Can also be written as an expression of the form `condition ? expression : expression` (which thus can occur everywhere expressions can occur, e.g. as a function argument).

### _For_ loop

```js
for (initialExpression; condition; incrementExpression) {
  // ...
}
```
Note that all three parts are optional and can be taken care of in the block instead, e.g. `for (; ;) { ... }` is possible. If no condition is given, JavaScript will assume `true`.

### _While_ loop

```js
// Evaluating the condition before executing the block:
while (condition) {
  // ...
}

// Evaluating the condition after executing the block:
do {
  // ...
} while (condition);
// Thus, the block is executed at least once.
```
