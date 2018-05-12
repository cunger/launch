console.log('01: ' + String(document.head.childNodes.length === 3));

console.log('02: ' + String(document.head.children[0].tagName === 'TITLE'));

console.log('04: ' + String(document.head.textContent.trim() === 'Title'));

console.log('05: ' + String(document.body.children.length === 3));

console.log('06: ' + String(document.body.childNodes.length === 5));
console.log(document.body.childNodes);

console.log('08: ' + String(document.querySelector('div').parentNode.parentNode.tagName === 'BODY'));

console.log('09: ' + String(document.querySelector('div section').children[2].nextElementSibling === null));

console.log('10: ' + String(document.querySelectorAll('div').length === 1));

console.log('11: ' + String(document.querySelector('footer').children.length === 1));

console.log('12: ' + String(document.querySelector('body').replaceChild(
  document.querySelector('footer'),
  document.body.firstElementChild
).tagName === 'HEADER'));

var nodeA = document.body.firstElementChild;
console.log('13: ' + String(document.body.appendChild(nodeA))); // header node

var sectionLines = document.querySelector('section').textContent.split("\n").map(function(text) {
  return text.trim();
}).filter(function(text) {
  return text.length > 0;
});
console.log('14: ' + String(sectionLines.length === 3));
console.log('15: ' + String(sectionLines.includes('H1')));
console.log('16: ' + String(sectionLines.includes('Hello')));
console.log('17: ' + String(sectionLines.includes('World')));

var sectionChildren = [].slice.call(document.querySelector('section').children);
console.log('18: ' + String(sectionChildren.length === 3));
console.log('19: ' + String(sectionChildren.filter(node => node.tagName === 'H1').length === 1));
console.log('20: ' + String(sectionChildren.filter(node => node.tagName === 'P').length === 2));

console.log('21: ' + String(document.querySelector('section').textContent.length === 54));
console.log('22: ' + String(document.querySelector('section').textContent));

console.log('23: ' + String(document.querySelector('span.emphasis').parentNode.tagName === 'FOOTER'));
