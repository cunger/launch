var fnord = {
  blubb: 'blubb',
  blah: (function () {
    console.log(this);
  }).bind(this)()
};

// {}
