function sliceTree(from, to) {
  var startNode = document.getElementById(String(from));
  var endNode   = document.getElementById(String(to));

  return findUpwardsPath(endNode, startNode);
}

function findUpwardsPath(currentNode, target, tags = []) {
  if (!currentNode || currentNode.tagName === 'BODY') return undefined;

  if (currentNode.nodeType === Node.ELEMENT_NODE) {
    tags.unshift(currentNode.tagName);
  }

  if (currentNode === target) return tags;

  return findUpwardsPath(currentNode.parentNode, target, tags);
}

function asArray(collection) {
  return Array.prototype.slice.call(collection);
}

// Examples

console.log(sliceTree(1, 1));
// ["ARTICLE"]
console.log(sliceTree(1, 4));
// ["ARTICLE", "HEADER", "SPAN", "A"]
console.log(sliceTree(1, 76));
// undefined
console.log(sliceTree(2, 5));
// undefined
console.log(sliceTree(5, 4));
// undefined
console.log(sliceTree(1, 23));
// ["ARTICLE", "FOOTER"]
console.log(sliceTree(1, 22));
// ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
console.log(sliceTree(11, 19));
// ["SECTION", "P", "SPAN", "STRONG", "A"]
