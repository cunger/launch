// Input: recipe (object), available ingredients (object)
// Output the number of cakes that can be baked (integer)

// Examples:

var available = {flour: 1200, sugar: 1200, eggs: 5, milk: 200};

console.log(cakes({flour: 500, sugar: 200, eggs: 1}, available) === 2);
console.log(available.flour === 1200); // should not be mutated

console.log(cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}) === 0);

// Recipe calls for something not present in the available ingredients:
console.log(cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200}) === 0);

// Aproach:
// for i from 0 counting up:
//   reduce the available ingredients by the ones needed for the recipe
//   if any available ingredient is below 0, return i

function cakes(recipe, available) {
  var remaining = Object.assign({}, available);
  var i;
  for (i = 0; ; i++) {
    Object.keys(recipe).forEach(function (key) {
      remaining[key] = (remaining[key] || 0) - recipe[key];
    })

    if (Object.values(remaining).some(v => v < 0)) return i;
  }
}
