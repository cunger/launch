function letterCaseCount(string) {
  var lowercaseCount = (string.match(/[a-z]/g) || []).length;
  var uppercaseCount = (string.match(/[A-Z]/g) || []).length;

  return {
           lowercase: lowercaseCount,
           uppercase: uppercaseCount,
           neither: string.length - uppercaseCount - lowercaseCount
         };
}

console.log(letterCaseCount('abCdef 123'));  // { lowercase: 5, uppercase: 1, neither: 4 }
console.log(letterCaseCount('AbCd +Ef'));    // { lowercase: 3, uppercase: 3, neither: 2 }
console.log(letterCaseCount('123'));         // { lowercase: 0, uppercase: 0, neither: 3 }
console.log(letterCaseCount(''));            // { lowercase: 0, uppercase: 0, neither: 0 }
