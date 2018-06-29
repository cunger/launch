(function () {
  // Type checking functionality for a given expression.
  // Can be called in two ways:
  //   type(expr).isArray();
  //   type().isArray(expr);
  const type = function (expr) {
    return {
      isArray:    (x) => Array.isArray(x || expr),
      isObject:   (x) => typeof(x || expr) === 'object' && !!(x || expr)
                      || typeof(x || expr) === 'function',
      isFunction: (x) => typeof(x || expr) === 'function',
      isString:   (x) => typeof(x || expr) === 'string',
      isNumber:   (x) => typeof(x || expr) === 'number',
      isBoolean:  (x) => typeof(x) === 'boolean' || typeof(expr) === 'boolean',
      isElement:  (x) => (x || expr) instanceof HTMLElement,
    };
  }

  // Utility object _.

  // Constructor that takes an expression and returns an object that
  // provides functionality for that expression, based on its type.
  const _ = function (expression) {
    var prototype = _ValuePrototype;
    if (type(expression).isObject()) prototype = _ObjectPrototype;
    if (type(expression).isArray())  prototype = _ArrayPrototype;

    Object.assign(prototype, type(expression));

    return Object.create(prototype).init(expression);
  };

  // Extend _ with functionality that is directly available,
  // independent of any expression.
  Object.assign(_, type());
  Object.assign(_, {
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
    }
  });

  // Expose _ to the top-level object.
  this._ = _;

  // Prototypes providing all type-specific functionality.

  const _ValuePrototype = (function () {
    var value;

    return {
      init: function (init_value) {
        value = init_value;
        return this;
      },
    };
  })();

  const _ArrayPrototype = (function () {
    var array;

    return {
      init: function (init_array) {
        array = init_array;
        return this;
      },

      first: function () {
        return array[0];
      },

      last: function () {
        return array[array.length - 1];
      },

      without: function (value) {
        return array.filter(element => element !== value);
      },

      lastIndexOf: function (value) {
        for (let i = array.length; i >= 0; i--) {
          if (array[i] == value) {
            return i;
          }
        }
      },

      sample: function (n) {
        const randomInt = function (max) {
          return Math.floor(Math.random() * Math.floor(max));
        };

        if (n === undefined) return array[randomInt(array.length)];

        if (n <= 0 || array.length === 0) return [];
        if (n >= array.length) return array.slice();

        var samples = [];
        var indices = _.range(array.length);

        while (samples.length < n) {
          let i = indices.splice(randomInt(indices.length), 1);
          samples.push(array[i]);
        }

        return samples;
      },

      findWhere: function (other) {
        var properties = Object.getOwnPropertyNames(other);

        for (let i = 0; i < array.length; i++) {
          let matches = true;

          for (let j = 0; j < properties.length; j++) {
            if (!_(array[i]).has(properties[j]) || array[i][properties[j]] != other[properties[j]]) {
              matches = false;
              break;
            }
          }

          if (matches) return array[i];
        }
      },

      where: function (other) {
        var matching_objects = [];
        var properties = Object.getOwnPropertyNames(other);

        for (let i = 0; i < array.length; i++) {
          let matches = true;

          for (let j = 0; j < properties.length; j++) {
            if (!_(array[i]).has(properties[j]) || array[i][properties[j]] != other[properties[j]]) {
              matches = false;
              break;
            }
          }

          if (matches) matching_objects.push(array[i]);
        }

        return matching_objects;
      },
    };
  })();

  const _ObjectPrototype = (function () {
    var object;

    return {
      init: function (init_object) {
        object = init_object;
        return this;
      },

      keys: function () {
        return Object.getOwnPropertyNames(object);
      },

      values: function () {
        var values = [];
        var keys = this.keys();

        for (let i = 0; i < keys.length; i++) {
          values.push(object[keys[i]]);
        }

        return values;
      },

      has: function (property) {
        return object.hasOwnProperty(property);
      },
    };
  })();
})();
