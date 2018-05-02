function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

// 1

document.body.childNodes.forEach(function (node) {
  if (node.nodeName === 'H1') {
    node.style.color = 'red';
    node.style.fontSize = '48px';
  }
});

// 2

var numberOfParagraphs = 0;

walk(document.body, function (node) {
  if (node.nodeName === 'P') {
    numberOfParagraphs += 1;
  }
});

console.log(numberOfParagraphs);

// 3

const firstWord = function (text) {
  return text.split(' ')[0];
}

let words = [];

walk(document.body, function (node) {
  if (node.nodeName === 'P') {
    let text = node.firstChild.textContent;
    words.push(firstWord(text.trimLeft()));
  }
});

console.log(words);

// 4

let isFirst = true;

walk(document.body, function (node) {
  if (node.nodeName === 'P') {
    if (isFirst) {
      isFirst = false;
    } else {
      node.classList.add('stanza');
    }
  }
});

console.log(document.querySelector('p'));

// 5

let imageCount = 0;
let pngCount = 0;

walk(document.body, function (node) {
  if (node.nodeName === 'IMG') {
    imageCount += 1;
    if (node.getAttribute('src').endsWith('.png')) {
      pngCount += 1;
    }
  }
});

console.log(imageCount);
console.log(pngCount);

// 6

walk(document.body, function (node) {
  if (node.nodeName === 'A') {
    node.style.color = 'red';
  }
});
