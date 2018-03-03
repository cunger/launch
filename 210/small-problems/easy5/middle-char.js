function centerOf(string) {
  var center = string.length / 2;

  return string.substring(Math.ceil(center) - 1, Math.floor(center) + 1);
}

console.log(centerOf('I Love Ruby'));      // "e"
console.log(centerOf('Launch School'));    // " "
console.log(centerOf('Launch'));           // "un"
console.log(centerOf('Launchschool'));     // "hs"
console.log(centerOf('x'));                // "x"
