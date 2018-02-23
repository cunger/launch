
// Prompt positive integer
var number;
do {
  number = Number(prompt('Please enter an integer greater than 0:'));
} while (!isPositiveInteger(number));

// Prompt operation (sum or product)
var operation;
do {
  operation = prompt('Enter "s" to compute the sum, or "p" to compute the product.').toLowerCase();
} while (!(operation === 's' || operation === 'p'));

// Compute result
var result;
switch (operation) {
  case 's': result = computeSumUpTo(number); break;
  case 'p': result = computeProductUpTo(number); break;
}

// Log result
var OPERATION_NAME = {'s': 'sum', 'p': 'product'};

alert('The ' + OPERATION_NAME[operation]
  + ' of the integers between 1 and ' + String(number)
  + ' is ' + String(result) + '.');

function computeSumUpTo(number) {
  var result = 0;
  var i;
  for (i = 1; i <= number; i++) {
    result += i;
  }
  return result;
}

function computeProductUpTo(number) {
  var result = 1;
  var i;
  for (i = 1; i <= number; i++) {
    result *= i;
  }
  return result;
}

function isPositiveInteger(value) {
  return Number.isInteger(value) && value > 0;
}

// console.log(isPositiveInteger(1));
// console.log(isPositiveInteger(0));
// console.log(isPositiveInteger(3.14));
// console.log(isPositiveInteger(NaN));
