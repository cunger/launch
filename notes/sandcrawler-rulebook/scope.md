
## Hoisting

Prior to code execution, names are resolved and associated with their scope,
in the following order:
* `this`, `arguments`
* function parameters (so calling a function parameter `arguments` overrides the pre-defined one, also using `a, b, a`, the second `a` will override the first one)
* function declarations
* variable declarations

In this process, function declarations (including the function body) as well as variable declarations (but not assignments) are _hoisted_, which is as if they are moved to the top of their scope. Function declarations are hoisted before variable declarations.

Example (from [Ben Cherry](http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html)):

```js
var foo = 1;

function bar() {
  if (!foo) {
    var foo = 10;
  }

  console.log(foo);
}

bar();
```
