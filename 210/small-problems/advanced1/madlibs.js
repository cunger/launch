const ADJECTIVES = ['quick', 'lazy', 'sleepy', 'noisy', 'hungry'];
const NOUNS      = ['fox', 'dog', 'head', 'leg', 'tail'];
const VERBS      = ['jumps', 'lifts', 'bites', 'licks', 'pats'];
const ADVERBS    = ['easily', 'lazily', 'noisily', 'excitedly'];

function madlibs(template) {
  var string = template;
  var match;
  var filler;
  while (match = string.match(/<(.*?)>/)) {
    switch (match[1]) {
      case 'ADJECTIVE': filler = getRandom(ADJECTIVES); break;
      case 'NOUN':      filler = getRandom(NOUNS); break;
      case 'VERB':      filler = getRandom(VERBS); break;
      case 'ADVERB':    filler = getRandom(ADVERBS); break;
    }

    string = string.replace(match[0], filler);
  }

  return string;
}

function getRandom(array) {
  return array[getRandomInt(array.length)]; 
}

// from MDN
function getRandomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

const template1 = "The <ADJECTIVE> brown <NOUN> <ADVERB> <VERB> the <ADJECTIVE> yellow <NOUN>, who <ADVERB> <VERB> his <NOUN> and looks around.";
const template2 = "The <NOUN> <VERB> the <NOUN>'s <NOUN>.";

console.log(madlibs(template1));
console.log(madlibs(template1));
console.log(madlibs(template2));
console.log(madlibs(template2));
