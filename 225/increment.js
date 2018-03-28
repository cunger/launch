var foo = {
  a: 0,
  incrementA: function() {
    var increment = function () {
      this.a += 1;
    }.bind(this);

    increment();
    increment();
    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();

console.log(foo.a);


var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

console.log(myObject.myChildObject.myMethod.call(myObject));
