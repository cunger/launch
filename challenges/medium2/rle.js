// Run-length encoding

// Compress

// Input: original data string, without numbers (otherwise not uniquely decompressable)
// Output: compressed data string

// Replace all consecutive chars that are the same by their count + one char.
// Leave all other characters the same.

// Option 1: Walk over the input string, char by char. Store the current char and its count.
//           If the next char is different:
//             If stored count is > 1, append count + stored char to output string,
//             otherwise append only stored char to output string.
//             Store next char with count 1.
//           If next char is the same: increase count by 1.
//           When done, make sure to also append the store to the string.
//
// Option 2: Use a regex to match all substrings of repeating chars.
//           While matches from /(.+)\1+/
//             match is e.g. [ 'WWWWW', 'W', ... ]
//             replace the first occurence by match[0].length + match[1]

console.log(compress("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB") === "12WB12W3B24WB");
console.log(compress("Launch School") === "Launch Sch2ol");
console.log(compress("ababababa") === "ababababa");
console.log(compress("    ----") === "4 4-");
console.log(compress("") === "");
console.log(compress("chirwr22 ln") === "chirwr22 ln");

function compress(string) {
  if (!compressible(string)) return string;

  var REPEATING_CHAR = /(.{1})\1+/g;
  var matches = string.match(REPEATING_CHAR) || [];
  matches.forEach(function (match) {
    string = string.replace(match, String(match.length) + match[0]);
  });

  return string;
}

function compressible(string) {
  return !/[0-9]/.test(string);
}

// Decompress

// Input: compressed data string
// Output: original data string

// Find all patterns 'number + char' and replace by char.repeat(number).

function decompress(string) {
  var COMPRESSED_CHAR = /([0-9]+)(.)/;
  var match;
  var count;
  var char;
  while (match = string.match(COMPRESSED_CHAR)) {
    char = match[2];
    count = Number(match[1]);
    string = string.replace(match[0], char.repeat(count));
  }

  return string;
}

console.log(decompress("12WB12W3B24WB") === "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB");
console.log(decompress(compress("AABCCCDEEEE")) === "AABCCCDEEEE");
console.log(decompress("fnord") === "fnord");
console.log(decompress("") === "");
console.log(decompress("4 4-") === "    ----");
