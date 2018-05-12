function startCounting() {
  var i = 0;
  return setInterval(function () { i++; console.log(i); }, 1000);
}

function stopCounting(id) {
  return function () {
    clearInterval(id);
  }
}

var id = startCounting();
setTimeout(stopCounting(id), 10500);
