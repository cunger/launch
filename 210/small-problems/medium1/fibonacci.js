// Recursive

function fibonacci(n) {
  if (n < 3) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

console.log(fibonacci(1) === 1);
console.log(fibonacci(2) === 1);
console.log(fibonacci(3) === 2);
console.log(fibonacci(4) === 3);
console.log(fibonacci(5) === 5);
console.log(fibonacci(12) === 144);
console.log(fibonacci(20) === 6765);

// Procedural

function fib(n) {
  if (n < 2) return 1;

  var prev = 1;
  var curr = 1;
  var temp;
  var i;
  for (i = 3; i <= n; i += 1) {
    temp = curr;
    curr += prev;
    prev = temp;
  }

  return curr;
}

console.log(fib(20) === 6765);
console.log(fib(50) === 12586269025);
console.log(fib(100) === 354224848179261915075); // Gosh, too big!

// Memoized

(function memoized() {
  var CACHE = { 1: 1, 2: 1 };

  function fibon(n) {
    if (CACHE[n]) return CACHE[n];

    CACHE[n] = fibon(n - 1) + fibon(n - 2);

    return CACHE[n];
  }

  console.log(fibon(20) === 6765);
  console.log(fibon(50) === 12586269025);
}());
