// Get word counts of all h2 headings (as list)

h2s = Array.prototype.slice.call(document.body.getElementsByTagName('h2'));
h2wordCounts = h2s.map(function (element) {
  return element.textContent.split(' ').length;
});

console.log(h2wordCounts);

// Different ways to get TOC div

console.log(document.body.getElementById('toc'))
console.log(document.querySelector('#toc'))
console.log(document.body.getElementsByClassName('toc')[0]);
console.log(document.querySelectorAll('.toc')[0]);

// Change the color of every other link in the TOC to green

tocLinks = Array.prototype.slice.call(document.querySelectorAll('#toc a'));

var i;
for (i = 0; i < tocLinks.length; i++) {
  if (i % 2 > 0) {
    tocLinks[i].style.color = 'green';
  }
}

// Collect the texts of all thumbnail captions.

thumbCaptions = Array.prototype.slice.call(document.getElementsByClassName('thumbcaption'));
thumbCaptionTexts = thumbCaptions.map(element => element.textContent.trim());

console.log(thumbCaptionTexts);

// Scientific classification

let classification = {};
let keys = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];

let trs = Array.prototype.slice.call(document.querySelectorAll('.infobox tr'));
trs.forEach(function (node) {
  let text = node.textContent.trim();

  keys.forEach(function (key) {
    if (text.startsWith(key)) {
      classification[key] = text.replace(key + ':', '').trim();
    }
  });
});

console.log(classification);
