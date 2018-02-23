var bill = parseFloat(prompt('What is the bill?'));
var tipPercentage = parseFloat(prompt('What is the tip percentage?'));

var tip = bill / 100 * tipPercentage;
var total = bill + tip;

alert('The tip is $' + tip.toFixed(2) + '\n'
    + 'The total is $' + total.toFixed(2));
