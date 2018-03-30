// 1

function makeMultipleLister(number) {
  return function () {
    let multiple;
    for (multiple = number; multiple < 100; multiple += number) {
      console.log(multiple);
    }
  }
}

var lister = makeMultipleLister(13);
lister();

// 2

let total = 0;

function add(number) {
  total += number;
  console.log(total);
}

function subtract(number) {
  total -= number;
  console.log(total);
}

add(1);
add(42);
subtract(39);
add(6);

// 3

function later(func, args) {
  return function () {
    return func(args);
  }
}

var logWarning = later(console.log, 'The system is shutting down!');
logWarning();

var checkWhetherZeroIsEven = later(function (num) { return num % 2 === 0; }, 0);
checkWhetherZeroIsEven();
