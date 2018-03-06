function anagram(word, list) {
  function sortedChars(string) {
    return string.split('').sort();
  }

  var wordChars = sortedChars(word);

  return list.filter(function (str) {
    return sameValues(wordChars, sortedChars(str));
  });
}

// cf. 210 > arrays > equals.js
function sameValues(array1, array2) {
  if (array1.length !== array2.length) {
    return false;
  }

  return array1.every(function (element, i) {
    return element === array2[i];
  });
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana'])); // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));  // [ "enlist", "inlets" ]
