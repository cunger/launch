// For a given n, log every pair of primes that sum to n.
// If n is odd or < 4, log null.

function goldbach(n) {
  if (n < 4 || n % 2 !== 0) {
    console.log('null');
    return;
  }

  var primes = primesUpTo(n);
  var i;
  var j;
  for (i = 0; i < primes.length; i ++) {
    for (j = i; j < primes.length; j++) {
      var p1 = primes[i];
      var p2 = primes[j];
      if (p1 + p2 === n) {
        console.log(String(p1) + ' ' + String(p2));
      }
    }
  }
}

// Sieve of Erastosthenes

function primesUpTo(n) {
  var candidates = []
  for (var i = 2; i <= n; i++) {
    candidates.push(i);
  }

  var primes = []
  var prime;
  while (candidates.length > 0) {
    prime = candidates.shift();
    primes.push(prime);
    candidates = candidates.filter(c => c % prime !== 0);
  }

  return primes;
}

// Examples

console.log(primesUpTo(30));

console.log('---- 3 ----');
goldbach(3);

console.log('---- 4 ----');
goldbach(4);

console.log('---- 12 ----');
goldbach(12);

console.log('---- 100 ----');
goldbach(100);
