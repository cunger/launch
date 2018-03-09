const POSITIVE_WORDS = /(fortunes?)|(dream(s|t|ed)?)|(love(s|d)?)|(respect(s|ed)?)|(patien(ce|t)?)|(devout(ly)?)|(nobler?)|(resolut(e|ion)?)/gi;
const NEGATIVE_WORDS = /(die(s|d)?)|(heartached?)|(death)|(despise(s|d)?)|(scorn(s|ed)?)|(weary)|(troubles?)|(oppress(es|ed|or('s)?)?)/gi;

function sentiment(text) {
  const isPositive = word => POSITIVE_WORDS.test(word);
  const isNegative = word => NEGATIVE_WORDS.test(word);

  var words = clean(text).split(/[\s\n,.\-]+/);

  var sentiments = { positive: [], negative: [] };
  words.forEach(function (word) {
    if (isPositive(word)) sentiments.positive.push(word);
    if (isNegative(word)) sentiments.negative.push(word);
  });

  reportSentiment(sentiments);
}

function clean(text) {
  return text.replace(/\[F:/g, '')
             .replace(/\]/g, '');
}

function reportSentiment(sentiments) {
  console.log('\nThere are ' + sentiments.positive.length + ' positive words in the text.');
  console.log('Positive sentiments: ' + sentiments.positive.join(', '));

  console.log('\nThere are ' + sentiments.negative.length + ' negative words in the text.');
  console.log('Negative sentiments: ' + sentiments.negative.join(', '));

  var sentiment;
  if (sentiments.positive.length > sentiments.negative.length) {
    sentiment = 'positive';
  } else if (sentiments.positive.length < sentiments.negative.length) {
    sentiment = 'negative';
  } else {
    sentiment = 'neutral';
  }

  console.log('\nThe sentiment of the text is ' + sentiment + '.');
}

// Example

var textExcerpt = 'To be or not to be-that is the question:\n' +
  'Whether \'tis nobler in the mind to suffer\n' +
  'The slings and arrows of outrageous fortune,\n' +
  'Or to take arms against a sea of troubles,\n' +
  'And, by opposing, end them. To die, to sleep-\n' +
  'No more-and by a sleep to say we end\n' +
  'The heartache and the thousand natural shocks\n' +
  'That flesh is heir to-\'tis a consummation\n' +
  'Devoutly to be wished. To die, to sleep-\n' +
  'To sleep, perchance to dream. Aye, there\'s the rub,\n' +
  'For in that sleep of death what dreams may come,\n' +
  'When we have shuffled off this mortal coil,\n' +
  'Must give us pause. There\'s the respect\n' +
  'That makes calamity of so long life.\n' +
  'For who would bear the whips and scorns of time,\n' +
  'Th\' oppressor\'s wrong, the proud man\'s contumely, [F: poor]\n' +
  'The pangs of despised love, the law’s delay, [F: disprized]\n' +
  'The insolence of office, and the spurns\n' +
  'That patient merit of the unworthy takes,\n' +
  'When he himself might his quietus make\n' +
  'With a bare bodkin? Who would fardels bear, [F: these Fardels]\n' +
  'To grunt and sweat under a weary life,\n' +
  'But that the dread of something after death,\n' +
  'The undiscovered country from whose bourn\n' +
  'No traveler returns, puzzles the will\n' +
  'And makes us rather bear those ills we have\n' +
  'Than fly to others that we know not of?\n' +
  'Thus conscience does make cowards of us all,\n' +
  'And thus the native hue of resolution\n' +
  'Is sicklied o\'er with the pale cast of thought,\n' +
  'And enterprises of great pitch and moment, [F: pith]\n' +
  'With this regard their currents turn awry, [F: away]\n' +
  'And lose the name of action.-Soft you now,\n' +
  'The fair Ophelia.-Nymph, in thy orisons\n' +
  'Be all my sins remembered';

sentiment(textExcerpt);

// There are 5 positive words in the text.
// Positive sentiments: fortune, dream, respect, love, resolution
//
// There are 6 negative words in the text.
// Negative sentiments: die, heartache, die, death, weary, death
//
// The sentiment of the text is Negative.
