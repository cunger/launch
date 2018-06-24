(function () {
  const type_check = {
    isArray:    (x) => Array.isArray(x),
    isObject:   (x) => typeof x === 'object' && !!x || typeof x === 'function',
    isFunction: (x) => typeof x === 'function',
    isString:   (x) => typeof x === 'string',
    isNumber:   (x) => typeof x === 'number',
    isBoolean:  (x) => typeof x === 'boolean',
    isElement:  (x) => x instanceof HTMLElement,
  };

  const _ = function (object) {
    var proto = _ValueProto;

    if (type_check.isObject(object)) proto = _ObjectProto;
    if (type_check.isArray(object))  proto = _ArrayProto;

    return Object.create(proto).init(object);
  };

  Object.assign(_, type_check);

  // Expose _

  this._ = _;

  // ---------------
  // Value prototype
  // ---------------

  const _ValueProto = (function () {
    var value;

    return {
      init: function (init_value) {
        value = init_value;
        return this;
      },

      isArray:    () => type_check.isArray(value),
      isObject:   () => type_check.isObject(value),
      isFunction: () => type_check.isFunction(value),
      isString:   () => type_check.isString(value),
      isNumber:   () => type_check.isNumber(value),
      isBoolean:  () => type_check.isBoolean(value),
      isElement:  () => type_check.isElement(value),

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

    };
  })();

  // ---------------
  // Array prototype
  // ---------------

  const _ArrayProto = (function () {
    var array;

    return {
      init: function (init_array) {
        array = init_array;
        return this;
      },

      isArray:    () => type_check.isArray(array),
      isObject:   () => type_check.isObject(array),
      isFunction: () => type_check.isFunction(array),
      isString:   () => type_check.isString(array),
      isNumber:   () => type_check.isNumber(array),
      isBoolean:  () => type_check.isBoolean(array),
      isElement:  () => type_check.isElement(array),

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
        var indices = _().range(array.length);

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

  // ----------------
  // Object prototype
  // ----------------

  const _ObjectProto = (function () {
    var object;

    return {
      init: function (init_object) {
        object = init_object;
        return this;
      },

      isArray:    () => type_check.isArray(object),
      isObject:   () => type_check.isObject(object),
      isFunction: () => type_check.isFunction(object),
      isString:   () => type_check.isString(object),
      isNumber:   () => type_check.isNumber(object),
      isBoolean:  () => type_check.isBoolean(object),
      isElement:  () => type_check.isElement(object),

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
