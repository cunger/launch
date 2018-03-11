// Determine the percentage of characters that are
// - upper case,
// - lower case,
// - neither.
// Format the percentages as string with two decimals.

// Input: non-empty string
// Output: { lowercase: , uppercase: , neither: }

// Examples

console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

// Approach:
// - Count uppercase, lowercase, and other chars.
// - Compute percentage by dividing each count by the length of the string.
// - Format percentages.

function letterPercentages(string) {
  function percentage(count, total) {
    return 100 * (count / total);
  }

  function format(percentage) {
    return String(percentage.toFixed(2));
  }

  var total = string.length;
  var uppercaseCount = (string.match(/[A-Z]/g) || []).length;
  var lowercaseCount = (string.match(/[a-z]/g) || []).length;
  var neitherCount = total - uppercaseCount - lowercaseCount;

  return { uppercase: format(percentage(uppercaseCount, total)),
           lowercase: format(percentage(lowercaseCount, total)),
           neither:   format(percentage(neitherCount, total)) };
}
