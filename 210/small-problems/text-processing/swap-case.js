function swapcase(string) {
  const LOWERCASE = /[a-z]/;
  const UPPERCASE = /[A-Z]/;

  const swap = function (char) {
    if (LOWERCASE.test(char)) return char.toUpperCase();
    if (UPPERCASE.test(char)) return char.toLowerCase();
    return char;
  };

  return string.split('')
               .map(swap)
               .join('');
}

console.log(swapcase('CamelCase'));         // "cAMELcASE"
console.log(swapcase('Tonight on XYZ-TV')); // "tONIGHT ON xyz-tv"
