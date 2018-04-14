## 1

```js
var foo = {
  prop: 1,
};

var bar = foo;
var baz = {
  prop: 1,
};

bar === baz; // false
foo === bar; // true
```

On lines 1-3 we create a fresh object with the property `prop` referencing the primitive value `1`, and assign it to the global variable `foo`. On line 5 we then declare another global variable, `bar`, and assign it the value of `foo`, i.e. a pointer to the object we created. `foo` and `bar` therefore point to the exact same object, which is why line 11 evaluates to `true`. On lines 6-8, however, we create a new object. Although it has the same properties as the object `foo` points to, it is a different object, and thus line 12 evaluates to `false`.

## 2

_Are the following two ways to create a function equivalent or are there differences? Explain._

```js
function fnord() {
  // ...
}

var fnord = function () {
  // ...
}
```

Both lines 1-3 and lines 5-7 create a function together with a global variable `fnord` to which the function is assigns as value. The former do this by means of a function declaration, while the latter do this by declaring a global variable and assigning it the function as value. The only difference between both is that the function declaration will be hoisted including the function body, while from lines 5-7, only the variable declaration will be hoisted, and the assignment of that variable to the function will stay in place. So the first option makes `fnord` available as function everywhere within that scope, while in the second option, `fnord` will be `undefined` until line 5 is executed.

## 3

_What will lines 11 and 12 log and why?_

```js
var name = 'Bobbo';
var foo = {
  name: name,
  sayName: function() {
    console.log(this.name);
  },
};

var baz = foo.sayName;

foo.sayName();
baz();
```

Line 11 is a _method invocation_, invoking the function that is the value of the property `sayName` of the object `foo`. This function logs the `name` property of the current execution context `this`. Since the function was invoked with `foo` as the receiver, `this` points to `foo`, and `this.name` references the `name` property of the `foo` object. Its value is `name`, which is a globally defined variable accessible within the object, with value `'Bobbo'`. Line 11 will thus log `Boobo`.

Line 12 is a _function invocation_, executing the function value of `foo.sayName` in the context of the global object - the implicit receiver of the function invocation. Therefore, `this` points to the global object and what will be logged is the value of the global object's property `name`. In the browser, this property is defined on line 1, line 12 will thus also log `Bobbo`. (This is different in Node, though, which will log `undefined`.)

## 4

```js
var sayHello = function (name) {
  var text = 'Hello ' + name + '.';
  return function () {
    console.log(text);
  };
};

sayHello('Bobbo');
```

Lines 1-6 declare the variable `sayHello` and assign it as value an anonymous function that takes one argument as input, defines a string `text`, and returns a function that logs the value of `text`.

When invoking the function value of `sayHello` on the string `'Bobbo'` as argument on line 8, the return value is a function that will log the text `'Hello Bobbo.'`. In order for that logging to actually happen, we need to execute the returned function: `sayHello('Bobbo')()`.

`text` is an example of private data within `sayHello`. It's within the lexical scope of the function defined on lines 3-5, thus it is accessible to this function. When this function is created and returned, what is actually created is a _closure_ - the function together with all identifiers that are within its lexical scope. That's why the function can access `text` even when it is executed on line 8 in a scope that does not have access to that variable.  

## 5

```js
obj = {
  a: 'hello',
  b: 'world',
  foo: function() {
    var self = this;

    function bar() {
      console.log(self.a + ' ' + self.b);
    }

    bar();
  }
};

obj.foo(); // hello world

obj2 = {}
obj2.foo = obj.foo;   
obj2.foo() // undefined undefined
```

When executing `obj.foo()`, the execution context of `foo`, i.e. `this`, is implicitly bound to `obj`, as this is the explicit receiver of the function call. Inside the function body, the value of `this` is bound to the function-local variable `self`, which is within the scope of the function `bar`. When executing `bar` on line 11, its execution context (`this`) points to the global object, but it uses the value of self (`obj`) in order to retrieve the properties `a` and `b`. `obj.foo()` thus logs `hello world`.

When executing `obj2.foo()`, the execution context of `foo` is implicitly bound to `obj2`. The same chain as above happens, with the difference that trying to access properties `a` and `b` will yield `undefined`, as they are not properties of `obj2`.

## 6a

_Explain what the following code logs and why._

```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }

    fun();
  }
};

obj.method();
```

When executing `obj.method()`, the execution context of the function value of the `method` property on `obj` is implicitly bound to `obj`, as this is the explicit receiver of the function call. Within the function body, another function `fun` is defined and then invoked on line 7. Since this is a function invocation without an explicit receiver, the implicit receiver is the global object. The execution context for `fun` therefore is the global object, which is what will be logged to the console.

## 6b

_Show three ways to make it log `obj`._

One way is to store the value of `this` in a variable that is accessible to `fun`, and within the function body of `fun` log that variable instead of `fun`'s execution context:

```js
var obj = {
  method: function () {
    var that = this;

    function fun() {
      console.log(that);
    }

    fun();
  }
};
```

Another way is to explicitly bind the execution context of `fun` to the execution context of `method` (which is `obj`), such that `this` within `fun` is `obj` instead of the global object:  

```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    };

    fun.call(this);
  }
};
```

A third way is to permanently bind the function `fun` to the value of `this` when it points to `obj`. This way, each invocation of `fun` will use `obj` as execution context, no matter what the actual execution context is:  

```js
var obj = {
  method: function () {
    function fun() {
      console.log(this);
    }.bind(this);

    fun();
  }
};

obj.method();
```

## 7a

_What does line 6 evaluate to?_

```js
function Animal(species) {
  this.species = species;
}

var lion = Animal('Panthera leo');
lion;
```

Line 6 evaluates to `undefined`, because the constructor function `Animal` has been called without the `new` operator. So what happened is that, on line 2, `Animal` assigned the argument if received for the `species` parameters (`'Panthera leo'`) to `this.species`, where `this` points to the global object, as this is the implicit receiver of the function invocation of `Animal` on line 5. The return value of `Animal` then is `undefined`, as it has no explicit `return` statement. `lion` therefore is `undefined`.

## 7b

_Explain what happens differently in this code snippet, when line 6 is executed._

```js
function Animal(species) {
  this.species = species;
}

var lion = new Animal('Panthera leo');
lion;
```

When the constructor function `Animal` is called with the `new` operator, the following happens: A fresh object is created, which is bound to the execution context of `Animal`. Then the function body is executed, with `this` pointing to this freshly created object, therefore the argument `'Panthera leo'` is assigned as property to that object. Finally, since the function body does not have an explicit return value, the freshly created object is returned. `lion` thus points to an object with one property, `species`, holding `'Panthera leo'` as value.

## 8

```js
var bar = {};
var baz = Object.create(bar);
var foo = Object.create(baz);

bar.isPrototypeOf(foo);             // true
Object.getPrototypeOf(foo) === bar; // false
```

```js
Object.getPrototypeOf(Foo) === Foo.__proto__; // true
Foo.__proto__ === Function.prototype;         // true
Foo.prototype.constructor === Foo;            // true
```

Line 1 creates an empty object by means of the object literal `{}` an assigns it to the variable `bar`. This object has `Object.prototype` as its prototype. Line 2 then creates a new object by means of `Object.create`, explicitly setting that object's prototype to the value of `bar`, and assigs it to `baz`. Line 3 in the same way creates a new object with the value of `baz` as prototype. Line 5 evaluates to true, because `bar.isPrototypeOf(foo)` checks whether `bar` is on the prototype chain of `foo`, which is the sequence `baz`, `bar`, `Object.prototype`. Line 6, on the other hand, evaluates to `false`, as `Object.getPrototypeOf(foo)` returns the immediate prototype of `foo`, i.e. the value of it's internal `[[Prototype]]` property, which is `baz`.  

## 9

_How is shared behaviour achieved in JS (as opposed to class-based OOP)?_

Behaviour is shared by means f the prototype chain.

The prototype chain of an object is a sequence of objects starting with the object referenced by the object's internal `[[Prototype]]` property, followed by the reference of that object's `[[Prototype]]` property, and so on, until the referenced object is `Object.prototype`, which is each object's prototype and does not have a prototype itself.  

Behaviour is shared between objects by **delegation**: When trying to access a property of an object, JavaScript first checks the object itself, and if it does not find a property of that name, walks through the prototype chain until it finds it or runs out of prototypes.

An object thus delegates each property that is does not specify itself to the first object on its prototype chain that does specify it.

## 10

_How does the following work?_

```js
"fnord".toUpperCase()
```

When a function is called on a primitive value, the corresponding constructor is called in order to create a temporary object of the appropriate type. In this case, a function is called on a string, which leads to the creation of a temporary object by means of the `String` constructor function. That object has `String.prototype` as its prototype, which implements methods like `toUpperCase`. This method's return value will be returned an the temporary object again destroyed. In this way, primitive values can "borrow" methods from the relevant constructor's prototype object.  

## 11

```js
function partial(fn) {
  var args = Array.prototype.slice.call(arguments, 1);
  var self = this;

  return function() {
    return fn.apply(self, args.concat(Array.prototype.slice.call(arguments)));
  };
}
```

Partial function application is the process of applying a function providing some of its parameters, returning a function that expects the rest of the parameters. 

## 12

_Explain how IIFEs and closures work together in the following snippet._

```js
// From Douglas Crockford

var digitName = function () {
  var names = ['zero', 'one', 'two', 'three', 'four',
               'five', 'six', 'seven', 'eight', 'nine'];

  return function (n) {
    return names[n];
  };
}();
```

## 13

_How could you implement `isArray(object)` in JavaScript?_

Arrays are objects and `typeof arr` returns `'object'`. The type of an object therefore doesn't tell us whether it's an array. However, arrays are constructed by means of the constructor function `Array`. The prototype of each object constructed with this constructor function has a `constructor` property pointing to `Array`. Thus, one way to check whether an object is an array is to check whether the `Array` constructor is on the prototype chain of the object, which is exactly what `instanceof` does.

```js
function isArray(object) {
  return (object instanceof Array);
}
```

The prototype chain of an object is a sequence of objects starting with the object referenced by the object's internal `[[Prototype]]` property, followed by the reference of that object's `[[Prototype]]` property, and so on, until the referenced object is `Object.prototype`, which is each object's prototype and does not have a prototype itself.  
