describe('_', function () {
  it('provides object functionality for objects', function () {
    expect(typeof _({}).keys).toBe('function');
    expect(typeof _({}).values).toBe('function');
    expect(typeof _({}).has).toBe('function');
    expect(typeof _({}).extend).toBe('function');
    expect(typeof _({}).pick).toBe('function');
    expect(typeof _({}).omit).toBe('function');
  });

  describe('keys()', function() {
    it('returns an array containing the keys of the object', function () {
      expect(_({a: 1, b: 2, c: 3}).keys()).toEqual(['a', 'b', 'c']);
    });

    it('returns an empty array if the oject has no keys', function () {
      expect(_({}).keys()).toEqual([]);
    });
  });

  describe('values()', function() {
    it('returns an array containing the values of the object', function () {
      expect(_({a: 1, b: 2, c: 3}).values()).toEqual([1, 2, 3]);
    });

    it('returns an empty array if the oject has no values', function () {
      expect(_({}).keys()).toEqual([]);
    });
  });

  describe('has(prop)', function() {
    it('returns true if the object contains the key prop', function () {
      expect(_({a: 1, b: 2, c: 3}).has('a')).toBe(true);
      expect(_({a: 1, b: 2, c: 3}).has('b')).toBe(true);
      expect(_({a: 1, b: 2, c: 3}).has('c')).toBe(true);
    });

    it('returns false if the object does not contain the key prop', function () {
      expect(_({a: 1, b: 2, c: 3}).has('e')).toBe(false);
      expect(_({}).has('a')).toBe(false);
    });
  });

  describe('matches(other)', function () {
    it('returns true if the object is the same as other', function () {
      expect(_({a: 1, b: 2}).matches({a: 1, b: 2})).toBe(true);
    });

    it('returns true if the object extends other', function () {
      expect(_({z: 0, a: 1, b: 2, c: 3}).matches({a: 1, b: 2})).toBe(true);
    });

    it('returns false if the object misses a property of other', function () {
      expect(_({a: 1, c: 3}).matches({a: 1, b: 2})).toBe(false);
    });

    it('returns false if the object maps a property of other to a different value', function () {
      expect(_({a: 1, b: 3}).matches({a: 1, b: 2})).toBe(false);
    });
  });

  describe('extend(other)', function () {
    var input = {a: 1, b: 0};
    var other = {a: 2, c: 3};

    it('extends the object with all property/value pairs of other', function () {
      expect(_(input).extend(other)).toEqual({a: 2, b: 0, c: 3});
    });
  });

  describe('_.extend(object, other1, other2)', function () {
    var object = {a: 1, b: 0};
    var other1 = {a: 2, c: 3};
    var other2 = {a: 3, d: 4};

    it('has the same effect as _(object).extend(_(other1).extend(other2))', function () {
      expect(_.extend(object, other1, other2)).toEqual(_(object).extend(_(other1).extend(other2)));
    });
  });

  describe('pick', function () {
    it('returns a new object retaining the specified keys', function () {
      var input = {z: 0, a: 1, b: 2, c: 3};

      expect(_(input).pick('a', 'c')).toEqual({a: 1, c: 3});
      expect(input).toEqual({z: 0, a: 1, b: 2, c: 3});
    });

    it('returns an empty object if the keys are unknown', function () {
      expect(_({a: 1, b: 2, c: 3}).pick('z')).toEqual({});
    });
  });

  describe('omit', function () {
    it('returns a new object retaining all but the specified keys', function () {
      var input = {z: 0, a: 1, b: 2, c: 3};

      expect(_(input).omit('a', 'c')).toEqual({z: 0, b: 2});
      expect(input).toEqual({z: 0, a: 1, b: 2, c: 3});
    });

    it('returns an empty object if all keys are ommitted', function () {
      expect(_({a: 1, b: 2, c: 3}).omit('a', 'b', 'c')).toEqual({});
    });
  });
});
