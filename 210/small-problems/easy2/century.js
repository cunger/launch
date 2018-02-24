
function century(year) {
  var century = String(Math.ceil(year / 100));
  var suffix = 'th';

  if (century.endsWith('1') && !century.endsWith('11')) {
    suffix = 'st';
  } else if (century.endsWith('2')  && !century.endsWith('12')) {
    suffix = 'nd';
  } else if (century.endsWith('3') && !century.endsWith('13')) {
    suffix = 'rd';
  }

  return century + suffix;
}


// Tests

console.log(century(2000) === "20th");
console.log(century(2001) === "21st");
console.log(century(1965) === "20th");
console.log(century(256) === "3rd");
console.log(century(5) === "1st");
console.log(century(10103) === "102nd");
console.log(century(1052) === "11th");
console.log(century(1127) === "12th");
console.log(century(11201) === "113th");
