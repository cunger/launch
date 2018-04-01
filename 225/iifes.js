// 3

var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function (arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);

// 4

function countdown(start) {
  (function step(n) {
    if (n < 0) {
      console.log('Done!');
      return;
    }

    console.log(n);
    step(n - 1)
  })(start);
}

countdown(7);
