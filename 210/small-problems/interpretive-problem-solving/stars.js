
function star(n) {
  var STAR  = '*';
  var SPACE = ' ';

  function pad(string) {
    var i = (n - string.length) / 2;
    return SPACE.repeat(i) + string + SPACE.repeat(i);
  }

  function stars(spaces) {
    return STAR + SPACE.repeat(spaces) + STAR + SPACE.repeat(spaces) + STAR;
  }

  var pointedStar = STAR.repeat(n);
  var i = 1;
  var line = STAR.repeat(3);
  while (line.length <= n) {
    pointedStar = [pad(line), pointedStar, pad(line)].join('\n');
    line = stars(i);
    i++;
  }

  console.log(pointedStar);
}

// Examples:

star(7);

// *  *  *
//  * * *
//   ***
// *******
//   ***
//  * * *
// *  *  *

star(9);

// *   *   *
//  *  *  *
//   * * *
//    ***
// *********
//    ***
//   * * *
//  *  *  *
// *   *   *
