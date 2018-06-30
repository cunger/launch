(function () {
  // Type checking functionality for a given value.
  const type = function (value) {
    return {
      isArray:    (x) => Array.isArray(x || value),
      isObject:   (x) => typeof(x || value) === 'object' && !!(x || value)
                      || typeof(x || value) === 'function',
      isFunction: (x) => typeof(x || value) === 'function',
      isString:   (x) => typeof(x || value) === 'string',
      isNumber:   (x) => typeof(x || value) === 'number',
      isBoolean:  (x) => typeof(x) === 'boolean' || typeof(value) === 'boolean',
      isElement:  (x) => (x || value) instanceof HTMLElement,
    };
  }

  // Utility object _.

  // Constructor that takes a value and returns an object that
  // provides functionality for that value based on its type.
  const _ = function (value) {
    var prototype = type(value);

    if (type(value).isObject()) {
      Object.assign(prototype, _ObjectPrototype(value));
    }

    if (type(value).isArray()) {
      Object.assign(prototype, _ArrayPrototype(value));
    }

    return Object.create(prototype);
  };

  // Extend _ with functionality that is directly available,
  // independent of any value.
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
    },

    extend: function () {
      var objects = Array.prototype.slice.call(arguments);

      return objects.reduceRight((next, current) => _(current).extend(next));
    }
  });

  // Expose _ to the top-level object.
  this._ = _;

  // Object prototype providing object-specific functionality.
  const _ObjectPrototype = function (object) {
    return {
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

      matches: function (other) {
        if (!_.isObject(other)) return false;

        return Object.getOwnPropertyNames(other).every(property =>
          object.hasOwnProperty(property) && object[property] === other[property]
        );
      },

      pick: function () {
        var properties = Array.prototype.slice.call(arguments);
        var new_object = {};

        properties.forEach(function (property) {
          if (object.hasOwnProperty(property)) {
            new_object[property] = object[property];
          }
        });

        return new_object;
      },

      omit: function () {
        var properties = Array.prototype.slice.call(arguments);
        var new_object = {};

        Object.getOwnPropertyNames(object).forEach(function (property) {
          if (!properties.includes(property)) {
            new_object[property] = object[property];
          }
        });

        return new_object;
      },

      extend: function (other) {
        Object.getOwnPropertyNames(other).forEach(function (property) {
          object[property] = other[property];
        });

        return object;
      },
    };
  };

  // Array prototype providing array-specific functionality.
  const _ArrayPrototype = function (array) {
    return {
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
        return array.find(element => _.isObject(element) && _(element).matches(other));
      },

      where: function (other) {
        return array.filter(element => _.isObject(element) && _(element).matches(other));
      },

      pluck: function (property) {
        return array.filter(element => _.isObject(element) && _(element).has(property))
                    .map(element => element[property]);
      }
    };
  };
})();
