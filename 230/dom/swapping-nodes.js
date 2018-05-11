// Node.prototype.isParentOf = function (node) {
//   while (node) {
//     node = node.parentNode;
//     if (node === this) return true;
//   }
//
//   return false;
// }

function nodeSwap(id1, id2) {
  node1 = document.getElementById(String(id1));
  node2 = document.getElementById(String(id2));

  if (!node1 || !node2)      return false;
  if (node1.contains(node2)) return false;
  if (node2.contains(node1)) return false;

  let parent1 = node1.parentNode;
  let parent2 = node2.parentNode;
  let placeholder1 = document.createElement('DIV');
  let placeholder2 = document.createElement('DIV');

  parent1.replaceChild(placeholder1, node1);
  parent2.replaceChild(placeholder2, node2);

  parent1.replaceChild(node2, placeholder1);
  parent2.replaceChild(node1, placeholder2);

  return true;
}

// Examples

console.log(nodeSwap(1, 20)); // false
console.log(nodeSwap(1, 4));  // false
console.log(nodeSwap(9, 3));  // false

console.log(nodeSwap(3, 1));  // true
console.log(nodeSwap(7, 9));  // true
