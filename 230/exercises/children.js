function childCount(node, countDirectOnes=true, countIndirectOnes=false, count=0) {
  children = Array.prototype.slice.call(node.childNodes);
  children.forEach(function (child) {
    if (countDirectOnes)   count += 1;
    if (countIndirectOnes) count += childCount(child, true, true);
  });

  return count;
}

const countDirectChildren   = node => childCount(node, true, false);
const countIndirectChildren = node => childCount(node, false, true);

function childNodes(id) {
  node = document.getElementById(String(id));

  return [countDirectChildren(node), countIndirectChildren(node)];
}

// Example

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach(function (n) {
  console.log(childNodes(n));
}

// [9, 12]
// [2, 1]
// [1, 0]
// [3, 1]
// [1, 0]
// [1, 1]
// [1, 0]
// [1, 2]
// [1, 1]
// [1, 0]
