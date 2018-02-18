// Conditionals

var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}

// String assignment

var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);

// Arithmetics

var number1 = parseInt(prompt('Enter the first number:'), 10);
var number2 = parseInt(prompt('Enter the second number:'), 10);

console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));

// Number of characters

var phrase = prompt("Please enter a phrase:");
console.log(typeof(phrase));

var numberOfCharacters = phrase.replace(/[^\w]/g, '').length;
console.log('There are ' + String(numberOfCharacters) + ' alphanumeric characters in "' + phrase + '".');
