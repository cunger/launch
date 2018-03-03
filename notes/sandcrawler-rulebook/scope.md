
JavaScript has lexical scope, i.e. the structure of the source code determines which variables are accessible where. Furthermore, variables declared via `var` are function-scoped. That is, functions create a new scope, while code blocks (`{ ... }`) do not.  

In ES6, variables declared via `let` and `const` are block-scoped, i.e. their scope is the innermost enclosing block.

In ES5, a common pattern to mimic block scope is an _immediately invoked function expression_ (IIFE):
```js
(function () {
  // ...
}());
```

When looking up a name, the JavaScript engine searches the scope hierarchy from bottom (local scope) to top (global scope), taking the first match it finds. Thus variables in a nested scope shadow variables with the same name in a higher scope. When not finding a name doing right-hand side look-up, it throws a `ReferenceError`. When not finding a name doing left-hand side look-up, it declares it as a property of the global object.   

## Hoisting

Prior to code execution, names are resolved and associated with their scope, in the following order:

* `this`, `arguments`
* function parameters (thus calling a function parameter `arguments` overrides the pre-defined one, also using `a, b, a`, the second `a` will override the first one)
* function declarations
* variable declarations

In this process, function declarations (including the function body) as well as variable declarations (without the assignments) are _hoisted_, that is they are processed first within their immediate scope, where function declarations are hoisted before variable declarations.

**Example** (from [Ben Cherry](http://www.adequatelygood.com/JavaScript-Scoping-and-Hoisting.html)):

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
Behaves like:
```js
function bar() {
  var foo;

  if (!foo) {
    foo = 10;
  }

  console.log(foo);
}

var foo;

foo = 1;

bar();
```

Keep in mind that function expressions are not hoisted, i.e. `var f = function () {...}` behaves just like any other variable assignment, with the declaration being hoisted, the function definition not.

## Closures
