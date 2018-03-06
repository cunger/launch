
function processBands(data) {
  return data.map(function (band) {
    return {
      'name': capitalizeWords(band.name.replace(/\./g, '')),
      'country': 'Canada',
      'active': band.active,
    };
  });
}

function capitalizeWords(string) {
  return string.split(' ')
               .map((word) => word[0].toUpperCase() + word.slice(1))
               .join(' ');
}

var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

console.log(processBands(bands));
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]
