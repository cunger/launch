function countOccurrences(array) {
  var occurrences = {};

  array.forEach(function (a) {
    occurrences[a] = (occurrences[a] || 0) + 1;
  });

  Object.keys(occurrences).forEach(function (key) {
    console.log(key + ' => ' + String(occurrences[key]));
  });
}

// Example

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// car => 4
// truck => 3
// SUV => 1
// motorcycle => 2
