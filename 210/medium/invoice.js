// ES5

// function invoiceTotal() {
//   var args = Array.prototype.slice.call(arguments);
//   return args.reduce(function (a, b) { return a + b; });
// }

// ES6

 function invoiceTotal(...nums) {
   return nums.reduce((a, b) => a + b);
 }

console.log(invoiceTotal(20, 30, 40, 50));         // 140
console.log(invoiceTotal(20, 30, 40, 50, 40, 40)); // 220
