// 5: [1, 2, 3]
// 8: [1, 2, 3]

var myArray = [1, 2, 3, 4];
var myOtherArray = myArray.slice();
// or:
// var myOtherArray = [];
// myArray.forEach(function (a) { myOtherArray.push(a); });

myArray.pop();
console.log(myOtherArray);

myArray = [1, 2];
console.log(myOtherArray);
