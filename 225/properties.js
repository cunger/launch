var person_prototype = {};

Object.defineProperties(person_prototype, {
  log: {
    value: function () {
      console.log(this.name);
    },
    writable: false,
  }
});

function newPerson(name) {
  var person = Object.create(person_prototype);
  person.name = name;
  return person;
}

var me = newPerson('Shane Riley');

console.log(me);
console.log(me.__proto__);
console.log(me.__proto__ === newPerson.prototype);

me.log();     // Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();     // Shane Riley
