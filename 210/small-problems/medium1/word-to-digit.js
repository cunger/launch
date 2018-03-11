function wordToDigit(text) {
  const DIGITS = [ 'zero', 'one', 'two', 'three', 'four', 'five',
                   'six', 'seven', 'eight', 'nine' ];

  const toDigitIfApplicable = function (word) {
    var digit = DIGITS.indexOf(word);
    if (digit !== -1) return String(digit);
    return word;
  };

  return text.split(/\b/)
             .map(toDigitIfApplicable)
             .join('');
}

// Example

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
