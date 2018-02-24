function getGrade(...scores) {
  var avg = scores.reduce((n1, n2) => n1 + n2) / scores.length;

  if (avg >= 90) return 'A';
  if (avg >= 80) return 'B';
  if (avg >= 70) return 'C';
  if (avg >= 60) return 'D';
  return 'F';
}


// Tests

console.log(getGrade(95, 90, 93) === 'A');
console.log(getGrade(95, 80, 79) === 'B');
console.log(getGrade(70, 72, 71) === 'C');
console.log(getGrade(50, 50, 95) === 'D');
console.log(getGrade(50, 42, 47) === 'F');
