// Find the greatest common divisor of two positive integers.

// Brute force: Count down from one integer to 1,
// picking the first number that divides both integers.

function gcd(x, y) {
  for (var n = Math.min(x, y); n > 0; n--) {
    if (x % n ===0 && y % n === 0) {
      return n;
    }
  }
}

console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
