var startTimestamp;

function delayLog() {
  function logger(text) {
    return function () {
      console.log('Executing after ' + String(Date.now() - startTimestamp) + ' msecs');
      console.log(text);
    }
  }

  var i;
  for (i = 1; i <= 10; i++) {
    console.log('Registering logger for ' + i);
    setTimeout(logger(String(i)), i * 1000);
  }
}

startTimestamp = Date.now();

delayLog();
