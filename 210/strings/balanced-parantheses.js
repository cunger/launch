function isBalanced(text) {
  var currentlyOpen = 0;
  var fineAtEachPoint = text.split('').every(function (char) {
    if (char === '(') currentlyOpen += 1;
    if (char === ')') currentlyOpen -= 1;
    return currentlyOpen >= 0;
  });

  return fineAtEachPoint && currentlyOpen == 0;
}

console.log(isBalanced('What (is) this?') === true);
console.log(isBalanced('What is) this?') === false);
console.log(isBalanced('What (is this?') === false);
console.log(isBalanced('((What) (is this))?') === true);
console.log(isBalanced('((What)) (is this))?') === false);
console.log(isBalanced('Hey!') === true);
console.log(isBalanced(')Hey!(') === false);
console.log(isBalanced('What ((is))) up(') === false);
