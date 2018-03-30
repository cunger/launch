
function makeList() {
  let list = [];

  return function(item) {
    if (!item) {
      if (list.length === 0) {
        console.log('The list is empty.');
      } else {
        list.forEach(function (todo) {
          console.log(todo);
        });
      }
      return;
    }

    if (list.includes(item)) {
      remove(list, item);
      console.log(item + ' removed!');
    } else {
      list.push(item);
      console.log(item + ' added!');
    }
  }
}

function remove(collection, item) {
  collection.splice(collection.indexOf(item), 1);
}

var list = makeList();

list();
// The list is empty.

list('make breakfast');
// make breakfast added!

list('read book');
// read book added!

list();
// make breakfast
// read book

list('make breakfast');
// make breakfast removed!

list();
// read book
