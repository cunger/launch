var n1 = prompt('Enter the 1st number:');
var n2 = prompt('Enter the 2nd number:');
var n3 = prompt('Enter the 3rd number:');
var n4 = prompt('Enter the 4th number:');
var n5 = prompt('Enter the 5th number:');
var n6 = prompt('Enter the last number:');

var firstFive = [n1, n2, n3, n4, n5];

if (firstFive.includes(n6)) {
  console.log('The number ' + n6 + ' appears in [' + firstFive.foin(', ') + '].');
} else {
  console.log('The number ' + n6 + ' does not appear in [' + firstFive.join(', ') + '].');
}
