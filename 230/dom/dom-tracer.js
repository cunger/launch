// Takes an element's id and returns the DOM tree of the element in a two-dimensional array.
// The first subarray contains the element and its siblings,
// the second contains the parent of the element and its siblings,
// so on and so forth, all the way up to the node with id 1.

function domTreeTracer(id) {
  node = document.getElementById(String(id));
  tree = []

  while (node !== null && node.tagName !== 'BODY') {
    tags = [ node.tagName ];

    collectTags(tags, node.previousSibling, n => n.previousSibling);
    collectTags(tags, node.nextSibling, n => n.nextSibling);

    tree.push(tags);
    node = node.parentNode;
  }

  return tree;
}

function collectTags(tags, node, navigation) {
  if (!node) return;

  if (node.nodeType === Node.ELEMENT_NODE) {
    tags.push(node.tagName);
  }

  return collectTags(tags, navigation(node), navigation);
}

// Example

console.log(domTreeTracer(1));
// [["ARTICLE"]]
console.log(domTreeTracer(2));
// [["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
console.log(domTreeTracer(22));
// [["A"], ["STRONG"], ["SPAN", "SPAN"], ["P", "P"], ["SECTION", "SECTION"], ["HEADER", "MAIN", "FOOTER"], ["ARTICLE"]]
