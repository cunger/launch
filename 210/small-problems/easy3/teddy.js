
function random(min, max) {
  return min + Math.floor(Math.abs(max - min + 1) * Math.random());
}

var obj = {
  name: 'Teddy',
  age: random(20, 200),
};

console.log(obj.name + ' is ' + String(obj.age) + ' years old!');
