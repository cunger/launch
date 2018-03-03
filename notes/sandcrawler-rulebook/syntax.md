
## Expressions and statements

The two major syntactic categories in JavaScript are _expressions_ and _statements_.

## Loops

```js
for (initialExpression; condition; incrementExpression) {
  // ...
}
```
Note that all three parts are optional and can be taken care of in the block instead, e.g. `for (; ;) { ... }` is possible. If no condition is given, JavaScript will assume `true`.

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
