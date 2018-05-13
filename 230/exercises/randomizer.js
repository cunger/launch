function randomizer(...callbacks) {
  const MAX = 2000 * callbacks.length;

  var startTime;
  callbacks.forEach(function (callback) {
    setTimeout(function () {
      withTime(callback, startTime);
    }, randomInt(MAX));
  });

  secondsCounter(MAX / 1000);

  startTime = Date.now();
}

function withTime(func, startTime) {
  console.log(`Executing after ${(Date.now() - startTime) / 1000} seconds.`);
  func();
}

function secondsCounter(max) {
  var seconds = 0;
  var counter = setInterval(function () {
    seconds++;
    console.log(seconds);

    if (seconds === max) clearInterval(counter);
  }, 1000);
}

function randomInt(max) {
  return Math.floor(Math.random() * Math.floor(max));
}

// Example

function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

randomizer(callback1, callback2, callback3);
