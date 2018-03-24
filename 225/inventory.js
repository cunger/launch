var counter = 0;

function newId() {
  counter++;
  return counter;
}

function Product(name, price, stock = 0) {
  var id = newId();

  return {
    id: id,
    name: name,
    price: price,
    stock : stock,
    setPrice: function (price) {
      if (price <= 0) console.log('Price is invalid.');
      else this.price = price;
    },
    describe: function () {
      console.log('Name:  '  + this.name);
      console.log('ID:    '  + this.id);
      console.log('Price: $' + this.price);
      console.log('Stock: '  + this.stock);
    }
  }
}

var scissors = Product('Scissors', 10, 8);
var drill    = Product('Cordless Drill', 45, 15);

drill.setPrice(-100);
drill.setPrice(40);
drill.describe();

console.log(drill.id);
console.log(drill.id);
