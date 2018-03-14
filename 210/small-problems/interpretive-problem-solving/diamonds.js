// Examples:

diamond(1);
// *

diamond(3);
//  *
// ***
//  *

diamond(9);
//     *
//    ***
//   *****
//  *******
// *********
//  *******
//   *****
//    ***
//     *

// n x n grid:
// 1 *, 8 spaces
// ...
// n - 4 *, 4 spaces
// n - 2 *, 2 spaces
// n *, 0 spaces
// dito

// Algorithm: building up the string before displaying it
// lines = [ n * ]
// for i = 2 .. n-1; i += 2:
// push and unshift line: i/2 ' ' + n-i '*' + i/2 ' '
// join lines and display

function diamond(n) {
  var STAR  = '*';
  var SPACE = ' ';
  var lines = [ STAR.repeat(n) ];
  var line;
  var i;
  for (i = 2; i < n; i += 2) {
    line = SPACE.repeat(i/2) + STAR.repeat(n - i) + SPACE.repeat(i/2);
    lines.unshift(line);
    lines.push(line);
  }

  var diamond = lines.join('\n');

  console.log(diamond);
}

// Alternative: printing the diamond, line by line, from first to last line

function diamondInc(n) {
  var STAR  = '*';
  var SPACE = ' ';

  function line(stars, spaces) {
    return SPACE.repeat(spaces/2) + STAR.repeat(stars) + SPACE.repeat(spaces/2);
  }

  var i;
  // upper half
  for (i = n - 1; i >= 2; i -= 2) {
    console.log(line(n - i, i));
  }
  // center
  console.log(STAR.repeat(n));
  // lower half
  for (i = 2; i < n; i += 2) {
    console.log(line(n - i, i));
  }
}

diamondInc(1);
diamondInc(3);
diamondInc(9);

// Hollow diamond

// *

//  *
// * *
//  *

//     *      4 SPACE + STAR
//    * *     3 SPACE + STAR + n-8 SPACE + STAR
//   *   *    2 SPACE + STAR + n-6 SPACE + STAR
//  *     *   1 SPACE + STAR + n-4 SPACE + STAR
// *       *  0 SPACE + STAR + n-2 SPACE + STAR
//  *     *
//   *   *
//    * *
//     *

// i = 0..4
// n - (2*i + 2)

function hollowDiamond(n) {
  var STAR  = '*';
  var SPACE = ' ';
  var HALF  = Math.floor(n / 2)

  function line(n, i) {
    if (i === HALF) {
      return SPACE.repeat(i) + STAR + SPACE.repeat(i);
    } else {
      return SPACE.repeat(i) + STAR + SPACE.repeat(n - (2*i + 2)) + STAR + SPACE.repeat(i);
    }
  }

  var lines = [ line(n, 0) ];
  var i;
  for (i = 1; i <= HALF; i += 1) {
    lines.unshift(line(n, i));
    lines.push(line(n, i));
  }

  var diamond = lines.join('\n');

  console.log(diamond);
}

hollowDiamond(1);
hollowDiamond(3);
hollowDiamond(9);
hollowDiamond(15);
