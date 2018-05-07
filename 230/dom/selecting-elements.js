function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

// 1

pElements = [];

document.body.getChildNodes.forEach(function (node) {
  if (node instanceof HTMLParagraphElement) {
    pElements.push(node);
  }
});

console.log(pElements);

// 2

walk(document, function (node) {
  if (node instanceof HTMLParagraphElement) {
    node.classList.add('article-text');
  }
});

// 3

function getElementsByTagName(tagName, rootNode) {
  let elements = [];

  walk(rootNode, function (element) {
    if (element.nodeName == tagName.toUpperCase()) {
      elements.push(element);
    }
  });

  return elements;
}

function addClassToElements(className, elements) {
  elements.forEach(function (element) {
    element.classList.add(className);
  });
}

addClassToElements('test', getElementsByTagName('p', document.body));

// 4

function asArray(collection) {
  return Array.prototype.slice.call(collection);
}

let intros = asArray(document.body.getElementsByClassName('intro'));

intros.forEach(function (element) {
  asArray(element.getElementsByTagName('p')).forEach(function (p) {
    p.classList.add('intro-test');
  });
});
