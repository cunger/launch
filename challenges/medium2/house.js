// Pattern:
// lastIndex = length - 1
// assemble rhyme from PIECES.slice(lastIndex - 0)
// assemble rhyme from PIECES.slice(lastIndex - 1)
// assemble rhyme from PIECES.slice(lastIndex - 2)
// etc. until PIECES.slice(0)
//
// Loop from i = 0 to lastIndex, and assembled rhyme:
//   pieces = PIECES.slice(lastIndex - i)
//   rhyme = ''
//   for each piece:
//     if length is 1, rhyme += piece[0]
//     else rhyme += ' ' + piece[0] + '\n' + piece[1]
//
// In the end, add 'This is' in the beginning and '.' in the end,
// and log the rhyme.

function recite() {
  var PIECES = [
    ['the horse and the hound and the horn', 'that belonged to'],
    ['the farmer sowing his corn', 'that kept'],
    ['the rooster that crowed in the morn', 'that woke'],
    ['the priest all shaven and shorn', 'that married'],
    ['the man all tattered and torn', 'that kissed'],
    ['the maiden all forlorn', 'that milked'],
    ['the cow with the crumpled horn', 'that tossed'],
    ['the dog', 'that worried'],
    ['the cat', 'that killed'],
    ['the rat', 'that ate'],
    ['the malt', 'that lay in'],
    ['the house that Jack built']
  ];

  var lastIndex = PIECES.length - 1;
  var pieces;
  var rhyme;
  var i;
  for (i = 0; i <= lastIndex; i++) {
    rhyme = '';
    pieces = PIECES.slice(lastIndex - i);
    pieces.forEach(function (piece) {
      if (piece.length === 1) {
        rhyme += ' ' + piece[0];
      } else {
        rhyme += ' ' + piece[0] + '\n' + piece[1];
      }
    });

    rhyme = 'This is' + rhyme + '.\n';

    console.log(rhyme);
  }
}

recite();
