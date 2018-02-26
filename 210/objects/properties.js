// 1

function objectHasProperty(object, propertyName) {
  return Object.keys(object).includes(propertyName);
}

// Note that Array.prototype.includes() is ES6.
// The ES5 way would be: Object.keys(obj).indexOf(propertyName) !== -1;

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

console.log(objectHasProperty(pets, 'dog') === true);
console.log(objectHasProperty(pets, 'lizard') === false);
console.log(objectHasProperty(pets, 'mice') === true);

// 2

function incrementProperty(object, propertyName) {
  if (objectHasProperty(object, propertyName)) {
    object[propertyName]++;
  } else {
    object[propertyName] = 1;
  }
}

var wins = {
  steve: 3,
  susie: 4,
};

incrementProperty(wins, 'susie');   // 5
console.log(wins);                  // { steve: 3, susie: 5 }
incrementProperty(wins, 'lucy');    // 1
console.log(wins);                  // { steve: 3, susie: 5, lucy: 1 }

// 3

function copyProperties(objectFrom, objectTo) {
  var count = 0;
  var property;
  for (property in objectFrom) {
    objectTo[property] = objectFrom[property];
    count++;
  }

  return count;
}

var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};
console.log(copyProperties(hal, sal));  // 2
console.log(sal);                       // { model: 9000, enabled: true }

// 4

function wordCount(text) {
  var counts = {};

  text.split(' ').forEach(function (word) {
    incrementProperty(counts, word);
  });

  return counts;
}

console.log(wordCount('box car cat bag box'));  // { box: 2, car: 1, cat: 1, bag: 1 }
