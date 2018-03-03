function swapName(name) {
  var parts = name.split(' ');

  return parts[1] + ', ' + parts[0];

  // Alternative:
  // return name.split(' ').reverse().join(' ,');
}


console.log(swapName('Joe Roberts'));    // "Roberts, Joe"
