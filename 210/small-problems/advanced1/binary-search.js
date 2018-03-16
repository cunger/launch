function find(item, array, offset = 0) {
  if (array.length === 0) return -1;

  var center = Math.floor(array.length / 2);
  var centerItem = array[center];
  if (centerItem === item) return offset + center;

  if (item < centerItem) {
    return find(item, array.slice(0, center), offset);
  } else {
    return find(item, array.slice(center + 1), offset + 1 + center);
  }

  return -1;
}

// Examples

var yellowPages = ['Apple Store', 'Bags Galore',
                   'Bike Store',  'Donuts R Us',
                   'Eat a Lot',   'Good Food',
                   'Pasta Place', 'Pizzeria',
                   'Ruby Lounge', 'Zooper'];

console.log(find('Pizzeria', yellowPages) == 7);
console.log(find('Train Station', yellowPages) == -1);

console.log(find(1, [1, 3, 5]) == 0);
console.log(find(3, [1, 3, 5]) == 1);
console.log(find(5, [1, 3, 5]) == 2);
console.log(find(7, [1, 3, 5]) == -1);
console.log(find(0, [0]) === 0);
console.log(find(0, []) === -1);
