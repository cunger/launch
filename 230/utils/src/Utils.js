(function () {
  const _ = this._ = function (object) {
    return Object.create(_Proto).init(object);
  }

  _.isArray    = (object) => Array.isArray(object);
  _.isObject   = (object) => typeof object === 'object' && !!object || typeof object === 'function',
  _.isFunction = (object) => typeof object === 'function';
  _.isString   = (object) => typeof object === 'string';
  _.isNumber   = (object) => typeof object === 'number';
  _.isBoolean  = (object) => typeof object === 'boolean';
  _.isElement  = (object) => object instanceof HTMLElement;

  const _Proto = (function () {
    var object;

    return {
      init: function (value) {
        object = value;
        return this;
      },

      isArray:    () => _.isArray(object),
      isObject:   () => _.isObject(object),
      isFunction: () => _.isFunction(object),
      isString:   () => _.isString(object),
      isNumber:   () => _.isNumber(object),
      isBoolean:  () => _.isBoolean(object),
      isElement:  () => _.isElement(object),

      // -------------------
      // Array functionality
      // -------------------

      first: function () {
        return object[0];
      },

      last: function () {
        return object[object.length - 1];
      },

      without: function (value) {
        return object.filter(element => element !== value);
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

      lastIndexOf: function (value) {
        var i;
        for (i = object.length; i >= 0; i--) {
          if (object[i] == value) {
            return i;
          }
        }
      },

      sample: function (n) {
        const randomInt = function (max) {
          return Math.floor(Math.random() * Math.floor(max));
        };

        if (n === undefined) return object[randomInt(object.length)];

        if (n <= 0 || object.length === 0) return [];
        if (n >= object.length) return object.slice();

        var samples = [];
        var indices = this.range(object.length);

        while (samples.length < n) {
          let i = indices.splice(randomInt(indices.length), 1);
          samples.push(object[i]);
        }

        return samples;
      },

      // -------------------
      // Object functionality
      // -------------------

      // TODO
    };
  })();
})();
