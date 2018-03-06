//////////////////// Iteration //////////////

function myForEach(array, func) {
  var i;
  for (i = 0; i < array.length; i += 1) {
    func(array[i], i, array);
  }
}

var min = Infinity;
var getMin = function (value) {
  min = value <= min ? value : min;
};

console.log(myForEach([4, 5, 12, 23, 3], getMin)); // undefined
console.log(min);                                  // 3

/////////////////// Filtering //////////////

function myFilter(array, func) {
  var filteredArray = [];

  array.forEach(function (element, i, arr) {
    if (func(element, i, arr)) {
      filteredArray.push(element);
    }
  });

  return filteredArray;
}

var isPythagoreanTriple = function (triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

console.log(myFilter([{ a: 3, b: 4,  c: 5 },
                      { a: 5, b: 12, c: 13 },
                      { a: 1, b: 2,  c: 3 },], isPythagoreanTriple));
// [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ]

///////////////// Transformation //////////////

function myMap(array, func) {
  var transformedArray = [];

  array.forEach(function (element, i, arr) {
    transformedArray.push(func(element, i, arr));
  });

  return transformedArray;
}

var plusOne = function (n) { return n + 1; };

console.log(myMap([1, 2, 3, 4], plusOne)); // [ 2, 3, 4, 5 ]

function getBooksTitle(books) {
  return myMap(books, function (book) {
    return book.title
  });
}

var books = [
  {
    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
    author: 'Jon Ducket',
    edition: '1st',
  },
  {
    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
    author: 'Haverbeke',
    edition: '2nd',
  },
  {
    title: "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics",
    author: 'Jennifer Niederst Robbins',
    edition: '4th',
  },
];

var getTitle = function (book) {
  return book['title'];
};

console.log(getBooksTitle(books));
// [
//   "JavaScript and JQuery: Interactive Front-End Web Development",
//   "Eloquent JavaScript: A Modern Introduction to Programming",
//   "Learning Web Design: A Beginner's Guide to HTML, CSS, JavaScript, and Web Graphics"
// ]

////////////// Folding //////////////

function myReduce(array, func, initial) {
  var initialIsProvided = initial !== undefined;

  var accumulated  = initialIsProvided ? initial : array[0];
  var i = initialIsProvided ? 0 : 1;

  // array.slice(i).forEach(...)
  for (; i < array.length; i += 1) {
    accumulated = func(accumulated, array[i], i, array);
  }

  return accumulated;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};

console.log(myReduce([5, 12, 15, 1, 6], smallest)); // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));  // 49

////////////// Boolean checks ///////////////

function myOwnEvery(array, func) {
  for (var i = 0; i < array.length; i += 1) {
    if (!func(array[i], i, array)) {
      return false;
    }
  }

  return true;
}

function myOwnSome(array, func) {
  for (var i = 0; i < array.length; i += 1) {
    if (func(array[i], i, array)) {
      return true;
    }
  }

  return false;
}

var isAString = function (value) {
  return typeof value === 'string';
};

var isANumber = function (value) {
  return typeof value === 'number';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString)); // true
console.log(myOwnEvery(['a', 'a234', 23], isAString));     // false

console.log(myOwnSome(['a', 1, '1abc'], isANumber));       // true
console.log(myOwnEvery(['a', 'a234', '23'], isANumber));   // false
