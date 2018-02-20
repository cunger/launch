function divisibleBy(x, y) {
  return x % y === 0;
}

// almost FizzBuzz

function multiplesOfThreeAndFive(from, to) {
  from = from || 1;
  to = to || 100;

  var n;
  for (n = from; n <= to; n++) {
    if (divisibleBy(n, 15)) {
      console.log(String(n) + '!');
    } else if (divisibleBy(n, 5) || divisibleBy(n, 3)) {
      console.log(n);
    }
  }
}

multiplesOfThreeAndFive();
multiplesOfThreeAndFive(10, 20);

// FizzBuzz

function fizzbuzz() {
  var message;
  var i;

  for (i = 1; i <= 100; i++) {
    message = '';

    if (divisibleBy(i, 3)) {
      message += 'Fizz';
    }

    if (divisibleBy(i, 5)) {
      message += 'Buzz';
    }

    console.log(message || String(i));
  }
}

fizzbuzz();
