// Input: year > 1752
// Output: the number of Friday 13ths in that year

console.log(fridayThe13ths(1986) === 1);
console.log(fridayThe13ths(2015) === 3);
console.log(fridayThe13ths(2017) === 2);

// Approach:
// For each 13ths (Jan 13, Feb 13, ...), check whether it's a Friday.

function fridayThe13ths(year) {
  function isFriday(date) {
    return date.getDay() === 5;
  }

  var months = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
  return months.map(month => new Date(year, month, 13))
               .filter(isFriday)
               .length;
}
