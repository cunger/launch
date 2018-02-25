function join(array, separator) {
  var string = '';
  var i;

  for (i = 0; i < array.length; i++) {
    string += String(array[i]);
    if (i < array.length - 1) {
      string += separator;
    }
  }

  return string;
}

console.log(join(['bri', 'tru', 'wha'], 'ck ')); // 'brick truck wha'
console.log(join([1, 2, 3], ' and '));           // '1 and 2 and 3'
