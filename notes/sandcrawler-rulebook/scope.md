# Variable scope

JavaScript variables are lexically scoped, i.e. the structure of the source code determines which variables are accessible where.

Each scope has access to the variables it contains and to the variables in the scopes that surround it.

Variables declared via `var` are function-scoped. That is, functions create a new scope, while code blocks (`{ ... }`) do not. `var` variables are hoisted, and when declared in the global scope, they are added to the global object.

In ES6, variables declared via `let` and `const` are block-scoped, i.e. their scope is the innermost enclosing block. They are not subject to hoisting and are not added to the global object.

```js
var x = 0;
let y = 1;

this.x; // => 0
this.y; // => undefined
```

In ES5, a common pattern to mimic block scope (and thus limit the lifetime of a variable, either to make it private or to avoid global variables) is an _immediately invoked function expression_ (IIFE):
```js
(function () {
  // ...
}());
```
IIFEs can, of course, be passed parameters and given a meaningful name, just like any other function expression:
```js
var x = 23;

(function meaningfulName(number) {
  // ...
}(2 * x));
```

## Identifier look-up and hoisting

Prior to code execution, identifiers are resolved and associated with their scope, in the following order:

* `this`, `arguments`
* function parameters (thus calling a function parameter `arguments` overrides the pre-defined one, also using `a, b, a`, the second `a` will override the first one)
* function declarations
* variable declarations

> [T]here is always a chain of environments, starting with the currently active environment, continuing with its outer environment, and so on[, ending with] with the global environment. [...]
> To resolve an identifier, the complete environment chain is traversed, starting with the active environment.

When looking up an identifier, the JavaScript engine searches the scope hierarchy from bottom (local scope) to top (global scope), taking the first match it finds. Thus variables in a nested scope shadow variables with the same name in a higher scope.
When not finding an identifier doing right-hand side look-up, it throws a `ReferenceError`. When not finding a name doing left-hand side look-up, it declares it as a property of the global object.   

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
Is equivalent to:
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
