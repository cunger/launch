function transactionsFor(item, transactions) {
  return transactions.filter(t => t.id === item);
}

function isItemAvailable(item, transactions) {
  function countMoves(type, item) {
    return transactions.filter(t => t.id === item && t.movement == type)
                       .reduce((count, t) => count + t.quantity, 0);
  }

  function quantity(item) {
    return countMoves('in', item) - countMoves('out', item);
  }

  return quantity(item, transactions) > 0;
}

// Example

var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

console.log(transactionsFor(101, transactions));

// [ { id: 101, movement: "in",  quantity:  5 },
//   { id: 101, movement: "in",  quantity: 12 },
//   { id: 101, movement: "out", quantity: 18 }, ]

console.log(isItemAvailable(101, transactions)); // false
console.log(isItemAvailable(105, transactions)); // true
