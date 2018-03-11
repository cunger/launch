// New array: Insertion sort

function insertionSort(array) {
  if (array.length < 2) return array;

  var sorted = [ array[0] ];
  var i;
  var j;
  for (i = 1; i < array.length; i += 1) {
    var foundPosition = false;

    innerloop:
    for (j = 0; j < sorted.length; j += 1) {
      if (array[i] < sorted[j]) {
        sorted.splice(j, 0, array[i]);
        foundPosition = true;
        break innerloop;
      }
    }
    
    if (!foundPosition) sorted.push(array[i]);
  }

  return sorted;
}

// In place: Bubble sort

function bubbleSort(array) {
  if (array.length < 2) return array;

  function swap(array, i, j) {
    var tmp = array[i];
    array[i] = array[i + 1];
    array[i + 1] = tmp;
  }

  var performedASwap;
  do {
    performedASwap = false;

    var i;
    for (i = 0; i < array.length; i += 1) {
      if (array[i] > array[i + 1]) {
        swap(array, i, i + 1);
        performedASwap = true;
      }
    }

  } while (performedASwap);
}

// Examples

var array = [5, 3];
console.log(insertionSort(array));
bubbleSort(array);
console.log(array); // [3, 5]

var array = [6, 2, 7, 1, 4];
console.log(insertionSort(array));
bubbleSort(array);
console.log(array); // [1, 2, 4, 6, 7]

var array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
console.log(insertionSort(array));
bubbleSort(array);
console.log(array); // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
