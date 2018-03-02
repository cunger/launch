function wordSizes(text) {
  var counts = {};

  text.split(' ').forEach(function (word) {
    var length = word.length;
    if (length === 0) return;

    counts[length] = counts[length] || 0;
    counts[length] += 1;
  });

  return counts;
}

function plainWordSizes(text) {
  var counts = {};

  text.split(' ').forEach(function (word) {
    var length = word.replace(/[^\w]/g, '').length;
    if (length === 0) return;

    counts[length] = counts[length] || 0;
    counts[length] += 1;
  });

  return counts;
}


// Examples

console.log(wordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
console.log(wordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 1, "7": 2 }
console.log(wordSizes("What's up doc?"));                              // { "6": 1, "2": 1, "4": 1 }
console.log(wordSizes(''));                                            // {}

console.log(plainWordSizes('Four score and seven.'));                       // { "3": 1, "4": 1, "5": 2 }
console.log(plainWordSizes('Hey diddle diddle, the cat and the fiddle!'));  // { "3": 5, "6": 3 }
console.log(plainWordSizes("What's up doc?"));                              // { "5": 1, "2": 1, "3": 1 }
console.log(plainWordSizes(''));                                            // {}
