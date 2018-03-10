function staggeredCase(string) {
  var nextIsToUpperCase = true;
  
  var stagger = function (char) {
    if (!isLetter(char)) return char;

    if (nextIsToUpperCase) {
      nextIsToUpperCase = false;
      return char.toUpperCase();
    } else {
      nextIsToUpperCase = true;
      return char.toLowerCase();
    }
  }

  return string.split('')
               .map(stagger)
               .join('');
}

function isLetter(char) {
  return /[a-zA-Z]/.test(char);
}

console.log(staggeredCase('I Love Launch School!'));        // "I LoVe lAuNcH ScHoOl!"
console.log(staggeredCase('ALL_CAPS'));                     // "AlL_CaPs"
console.log(staggeredCase('ignore 77 the 444 numbers'));    // "IgNoRe 77 ThE 444 NuMbErS"
