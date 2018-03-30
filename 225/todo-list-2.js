
function makeList() {
  let items = [];

  return {
    list: function () {
      items.forEach(function (item) {
        console.log(item);
      });
    },

    add: function (item) {
      let index = items.indexOf(item);
      if (index === -1) {
        items.push(item);
        console.log(item + ' added!');
      }
    },

    remove: function (item) {
      let index = items.indexOf(item);
      if (index >= 0) {
        items.splice(index, 1);
        console.log(item + ' removed!');
      }
    },
  };
}


var list = makeList();

list.add('peas');
// peas added!

list.list();
// peas

list.add('corn');
// corn added!

list.list();
// peas
// corn

list.remove('peas');
// peas removed!

list.list();
// corn

list.remove('mint')

console.log(list.items); // undefined
