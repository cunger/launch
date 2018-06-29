describe('_', function () {
  describe('range(end)', function () {
    it('returns an array of values from 0 to end (excluding end)', function () {
      expect(_.range(7)).toEqual([0, 1, 2, 3, 4, 5, 6]);
    });

    it('returns an empty array when end <= 0', function () {
      expect(_.range(0)).toEqual([]);
      expect(_.range(-1)).toEqual([]);
    });
  });

  describe('range(start, end)', function () {
    it('returns an array of values from start to end (excluding end)', function () {
      expect(_.range(7, 11)).toEqual([7, 8, 9, 10]);
    });

    it('returns an empty array when end <= start', function () {
      expect(_.range(2, 1)).toEqual([]);
    });
  });

  describe('_.isObject(obj)', function () {
    it('returns true for objects', function () {
      expect(_.isObject({})).toBe(true);
    });

    it('returns true for functions', function () {
      expect(_.isObject((x) => x)).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isObject('Fnord!')).toBe(false);
      expect(_.isObject(3.14)).toBe(false);
      expect(_.isObject(true)).toBe(false);
      expect(_.isObject(0)).toBe(false);
      expect(_.isObject(undefined)).toBe(false);
      expect(_.isObject(null)).toBe(false);
    });
  });

  describe('_.isArray(obj)', function () {
    it('returns true for arrays', function () {
      expect(_.isArray([])).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isFunction({})).toBe(false);
      expect(_.isArray('Fnord!')).toBe(false);
      expect(_.isArray(3.14)).toBe(false);
      expect(_.isArray(true)).toBe(false);
      expect(_.isArray(undefined)).toBe(false);
      expect(_.isArray(null)).toBe(false);
    });
  });

  describe('_.isFunction(obj)', function () {
    it('returns true for functions', function () {
      expect(_.isFunction((x) => x)).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isFunction({})).toBe(false);
      expect(_.isFunction('Fnord!')).toBe(false);
      expect(_.isFunction(3.14)).toBe(false);
      expect(_.isFunction(true)).toBe(false);
      expect(_.isFunction(undefined)).toBe(false);
      expect(_.isFunction(null)).toBe(false);
    });
  });

  describe('_.isString(obj)', function () {
    it('returns true for strings', function () {
      expect(_.isString('Fnord!')).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isString({})).toBe(false);
      expect(_.isString(3.14)).toBe(false);
      expect(_.isString(true)).toBe(false);
      expect(_.isString(undefined)).toBe(false);
      expect(_.isString(null)).toBe(false);
    });
  });

  describe('_.isNumber(obj)', function () {
    it('returns true for numbers', function () {
      expect(_.isNumber(100)).toBe(true);
      expect(_.isNumber(3.14)).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isNumber({})).toBe(false);
      expect(_.isNumber('3.14')).toBe(false);
      expect(_.isNumber(true)).toBe(false);
      expect(_.isNumber(undefined)).toBe(false);
      expect(_.isNumber(null)).toBe(false);
    });
  });

  describe('_.isBoolean(obj)', function () {
    it('returns true for booleans', function () {
      expect(_.isBoolean(true)).toBe(true);
      expect(_.isBoolean(false)).toBe(true);
      expect(_.isBoolean(Boolean(23))).toBe(true);
      expect(_.isBoolean(Boolean(null))).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isBoolean({})).toBe(false);
      expect(_.isBoolean(3.14)).toBe(false);
      expect(_.isBoolean('Fnord!')).toBe(false);
      expect(_.isBoolean(undefined)).toBe(false);
      expect(_.isBoolean(null)).toBe(false);
    });
  });

  describe('_.isElement(obj)', function () {
    it('returns true for DOM elements', function () {
      console.log(typeof document.body);
      expect(_.isElement(document.body)).toBe(true);
    });

    it('returns false for others', function () {
      expect(_.isElement({})).toBe(false);
      expect(_.isElement(3.14)).toBe(false);
      expect(_.isElement('Fnord!')).toBe(false);
      expect(_.isElement(undefined)).toBe(false);
      expect(_.isElement(null)).toBe(false);
    });
  });

  describe('_(obj).is*()', function () {
    it('yields the same results as _.is*(obj)', function () {
      [
        {}, [], (x) => x,
        3.14,
        'Fnord!', '3.14',
        true, false, Boolean(23), Boolean(null),
        undefined, null,
        document.body
      ].forEach(function (value) {
        expect(_(value).isObject()).toBe(_.isObject(value));
        expect(_(value).isArray()).toBe(_.isArray(value));
        expect(_(value).isFunction()).toBe(_.isFunction(value));
        expect(_(value).isString()).toBe(_.isString(value));
        expect(_(value).isNumber()).toBe(_.isNumber(value));
        expect(_(value).isBoolean()).toBe(_.isBoolean(value));
        expect(_(value).isElement()).toBe(_.isElement(value));
      });
    });
  });
});
