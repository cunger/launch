//// Nodes -> Array ////

function nodesToArray(node = document.body, result = []) {
  result.push(node.tagName);
  result.push(asArray(node.children).map(child => nodesToArray(child)));

  return result;
}

function asArray(collection) {
  return Array.prototype.slice.call(collection);
}

// Examples

console.log(nodesToArray(document.getElementById('4')));
console.log(nodesToArray());

//// Array -> Nodes ////

function arrayToNodes(array) {
  let node = dom.createElement(array[0].toLowerCase());

  array[1].forEach(function (child) {
    node.appendChild(arrayToNodes(child));
  });

  return node;
}

// Examples

var example1 = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
var example2 = ["BODY",[["DIV",[["DIV",[]],["DIV",[["DIV",[]]]]]],["DIV",[]],["DIV",[["DIV",[]],["DIV",[]],["DIV",[]]]]]];

console.log(arrayToNodes(example1));
console.log(arrayToNodes(example2));
