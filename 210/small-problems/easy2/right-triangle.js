function triangle(n) {
  var i;
  for (i = 1; i <= n; i++) {
    console.log(' '.repeat(n - i) + '*'.repeat(i));
  }
}

// Examples

triangle(5);
triangle(9);
