function totalArea(rectangles) {
  return rectangles.map(function (rectangle) {
    return rectangle[0] * rectangle[1];
  }).reduce(function (areaSum, area) {
    return areaSum + area;
  }, 0);
}

function totalSquareArea(rectangles) {
  return totalArea(rectangles.filter(function (r) {
    return r[0] === r[1];
  }));
}

var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles)); // 141
console.log(totalSquareArea(rectangles)); // 121
