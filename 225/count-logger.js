function makeCounterLogger(end) {
  return function (start) {
    let i;
    
    if (start < end) {
      for (i = start; i <= end; i++) {
        console.log(i);
      }
    } else {
      for (i = start; i >= end; i--) {
        console.log(i);
      }
    }
  }
}

var countlog = makeCounterLogger(5);
countlog(8);
countlog(2);
