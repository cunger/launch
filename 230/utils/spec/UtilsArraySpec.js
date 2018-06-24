describe('_', function () {
  it('provides array functionality for arrays', function () {
    expect(typeof _([]).first).toBe('function');
    expect(typeof _([]).last).toBe('function');
    expect(typeof _([]).without).toBe('function');
    expect(typeof _([]).lastIndexOf).toBe('function');
    expect(typeof _([]).sample).toBe('function');
    expect(typeof _([]).findWhere).toBe('function');
    expect(typeof _([]).where).toBe('function');
  });

  describe('first()', function () {
    it('returns the first element of the array', function () {
      expect(_([47, 23, 0]).first()).toBe(47);
    });

    it('returns undefined for the empty array', function () {
      expect(_([]).first()).toBeUndefined();
    });
  });

  describe('last()', function () {
    it('returns the last element of the array', function () {
      expect(_([47, 23, 0]).last()).toBe(0);
    });

    it('returns undefined for the empty array', function () {
      expect(_([]).last()).toBeUndefined();
    });
  });

  describe('without(value)', function () {
    it('returns a new array that does not contain value', function () {
      var array = [47, 23, 0, 23];

      expect(_(array).without(23)).toEqual([47, 0]);
      expect(array).toEqual([47, 23, 0, 23]);
    });

    it('returns a copy of the array if it does not contain value', function () {
      var array = [47, 23, 0, 23];
      var result = _(array).without(10);

      expect(result).toEqual(array);
      expect(result).not.toBe(array);
    });

    it('returns an empty array for the empty array', function () {
      expect(_([]).without(23)).toEqual([]);
    });
  });

  describe('lastIndexOf(value)', function () {
    it('returns the last index of value in the array', function () {
      expect(_([47, 23, 0, 23]).lastIndexOf(23)).toBe(3);
    });

    it('returns undefined if the array does not contain value', function () {
      expect(_([47, 23, 0, 23]).lastIndexOf(10)).toBeUndefined();
    });
  });

  describe('sample()', function () {
    it('returns a random element of the array', function () {
      var array = [1, 2, 3, 4, 5];
      var sample = _(array).sample();

      expect(array).toContain(sample);
      expect(array).toEqual([1, 2, 3, 4, 5]);
    });

    it('returns undefined for the empty array', function () {
      expect(_([]).sample()).toBeUndefined();
    });
  });

  describe('sample(n)', function () {
    it('returns a list of n random elements from the array', function () {
      var array = [1, 2, 3, 4, 5];
      var sample = _(array).sample(2);

      expect(sample.length).toBe(2);
      expect(array).toContain(sample[0]);
      expect(array).toContain(sample[1]);
      expect(sample[0]).not.toBe(sample[1]);
      expect(array).toEqual([1, 2, 3, 4, 5]);
    });

    it('returns an empty array if the array is empty', function () {
      expect(_([]).sample(1)).toEqual([]);
    });

    it('returns an empty array if n <= 0', function () {
      expect(_([]).sample(0)).toEqual([]);
      expect(_([]).sample(-1)).toEqual([]);
    });

    it('returns the array if n >= the size of the array', function () {
      expect(_([1, 2, 3]).sample(4)).toEqual([1, 2, 3]);
    });
  });

  describe('findWhere(obj)', function() {
    var input = {a: 1, b: 2};
    var match1 = {a: 1, b: 2};
    var match2 = {a: 1, b: 2, c: 3};
    var distractor1 = {a: 4, b: 5};
    var distractor2 = {e: 1, f: 2};

    it('returns the first object with properties that match those of obj', function () {
      var objects = [distractor1, distractor2, match1, match2];

      expect(_(objects).findWhere(input)).toEqual(match1);
    });

    it('returns undefined if there is no matching object', function () {
      var objects = [distractor1, distractor2];

      expect(_(objects).findWhere(input)).toBeUndefined();
    });
  });

  describe('where(obj)', function() {
    var input = {a: 1, b: 2};
    var match1 = {a: 1, b: 2};
    var match2 = {a: 1, b: 2, c: 3};
    var distractor1 = {a: 4, b: 5};
    var distractor2 = {e: 1, f: 2};

    it('returns all objects with properties that match those of obj', function () {
      var objects = [distractor1, distractor2, match1, match2];

      expect(_(objects).where(input)).toEqual([match1, match2]);
    });

    it('returns an empty array if the properties of no object match those of obj', function () {
      var objects = [distractor1, distractor2];

      expect(_(objects).where(input)).toEqual([]);
    });
  });
});
