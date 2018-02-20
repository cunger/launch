
function sum(numbers) {
    var sum = 0;
    for (n of numbers) {
      sum += n;
    }
    return sum;
}

function average(numbers) {
  return sum(numbers) / numbers.length
}

function grading(numberOfScores) {
  // Get all scores
  var scores = [];
  for (var i = 1; i <= numberOfScores; i++) {
    var input = prompt('Please enter score ' + String(i) + ":");
    scores.push(parseInt(input));
  }

  var avg = average(scores);
  var grade;
  if (avg >= 90) {
    grade = 'A';
  } else if (avg >= 70) {
    grade = 'B';
  } else if (avg >= 50) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  console.log('Based on the average of your 3 scores your letter grade is "' + grade + '".');
}

grading(5);
