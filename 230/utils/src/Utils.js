const _ = (function () {
  const randomInt = function (max) {
    return Math.floor(Math.random() * Math.floor(max));
  }

  return {
    first: function (array) {
      return array[0];
    },

    last: function (array) {
      return array[array.length - 1];
    },

    without: function (array, value) {
      return array.filter(element => element !== value);
    },

    range: function () {
      var start = arguments[1] === undefined ? 0 : arguments[0];
      var end = arguments[1] || arguments[0];

      if (end <= start) return [];

      var values = [];
      var i;
      for (i = start; i < end; i++) {
        values.push(i);
      }

      return values;
    },

    lastIndexOf: function (array, value) {
      var i;
      for (i = array.length; i >= 0; i--) {
        if (array[i] == value) {
          return i;
        }
      }
    },

    sample: function (array, n) {
      if (n === undefined) return array[randomInt(array.length)];

      if (n <= 0 || array.length === 0) return [];
      if (n >= array.length) return array.slice();

      var samples = [];
      var indices = this.range(array.length);

      while (samples.length < n) {
        let i = indices.splice(randomInt(indices.length), 1);
        samples.push(array[i]);
      }

      return samples;
    }
  };
})();
