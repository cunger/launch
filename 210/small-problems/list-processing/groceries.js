function buyFruit(shoppingList) {
  function repeat(num, value) {
    // var list = [];
    // for (var i = 1; i <= num; i += 1) {
    //   list.push(value);
    // }
    // return list;
    return Array(num).fill(value);
  }

  return shoppingList.reduce(function (arr, item) {
    return arr.concat(repeat(item[1], item[0]));
  }, []);
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
