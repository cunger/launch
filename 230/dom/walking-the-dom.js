function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

walk(document.body, function (node) {
  console.log(node.nodeName);
});


// More general:
//
// function walk(node, onThisNode, getNextNode, stopCondition = n => false) {
//   if (!node || stopCondition(node)) return;
//
//   onThisNode(node);
//   walk(getNextNode(node), onThisNode, getNextNode, stopCondition);
// }
