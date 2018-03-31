function partial(func, arg1) {
  return function (arg2) {
    return func(arg1, arg2);
  }
}

function greet(greeting, name) {
  return greeting[0].toUpperCase() + greeting.slice(1) + ', ' + name + '!';
}

console.log(greet('howdy', 'Joe'));
// Howdy, Joe!
console.log(greet('good morning', 'Sue'));
// Good morning, Sue!

const sayHello = partial(greet, 'hello');
const sayHi = partial(greet, 'hi');

console.log(sayHello('Brandon'));
// Hello, Brandon!
console.log(sayHi('Sarah'));
// Hi, Sarah!

function subtract(a, b) {
  return a - b;
}

const sub5 = function (b) {
  return subtract(b, 5);
};

console.log(sub5(10)); // 5

function makeSubN(b) {
  return function (a) {
    return subtract(a, b);
  };
}

const anotherSub5 = makeSubN(5);

console.log(anotherSub5(10)); // 5

function makePartialFunc(func, b) {
  return function (a) {
    return func(a, b);
  }
}

function multiply(a, b) {
  return a * b;
}

var multiplyBy5 = makePartialFunc(multiply, 5);

console.log(multiplyBy5(100)); // 500

var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  return function (students) {
    return rollCall('Math', students);
  };
}

var mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// Math:
// Fatima
// Gary
// Susan
