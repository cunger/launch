describe('_', function () {
  it('includes all functionality', function () {
    expect(_.first).toBeDefined();
    expect(_.last).toBeDefined();
    expect(_.without).toBeDefined();
    expect(_.range).toBeDefined();
    expect(_.lastIndexOf).toBeDefined();
    expect(_.sample).toBeDefined();
  });

  describe('first(array)', function () {
    it('returns the first element of array', function () {
      expect(_.first([47, 23, 0])).toBe(47);
    });

    it('returns undefined for the empty array', function () {
      expect(_.first([])).toBeUndefined();
    });
  });

  describe('last(array)', function () {
    it('returns the last element of array', function () {
      expect(_.last([47, 23, 0])).toBe(0);
    });

    it('returns undefined for the empty array', function () {
      expect(_.last([])).toBeUndefined();
    });
  });

  describe('without(array, value)', function () {
    it('returns a new array that does not contain value', function () {
      var array = [47, 23, 0, 23];

      expect(_.without(array, 23)).toEqual([47, 0]);
      expect(array).toEqual([47, 23, 0, 23]);
    });

    it('returns a copy of array if array does not contain value', function () {
      var array = [47, 23, 0, 23];
      var result = _.without(array, 10);

      expect(result).toEqual(array);
      expect(result).not.toBe(array);
    });

    it('returns an empty array for the empty array', function () {
      expect(_.without([], 23)).toEqual([]);
    });
  });

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

  describe('lastIndexOf(array, value)', function () {
    it('returns the last index of value in array', function () {
      expect(_.lastIndexOf([47, 23, 0, 23], 23)).toBe(3);
    });

    it('returns undefined if array does not contain value', function () {
      expect(_.lastIndexOf([47, 23, 0, 23], 10)).toBeUndefined();
    });
  });

  describe('sample(array)', function () {
    it('returns some value of array', function () {
      var array = [1, 2, 3, 4, 5];
      var sample = _.sample(array);

      expect(array).toContain(sample);
      expect(array).toEqual([1, 2, 3, 4, 5]);
    });

    it('returns undefined for the empty array', function () {
      expect(_.sample([])).toBeUndefined();
    });
  });

  describe('sample(array, n)', function () {
    it('returns an array of n values from array', function () {
      var array = [1, 2, 3, 4, 5];
      var sample = _.sample(array, 2);

      expect(sample.length).toBe(2);
      expect(array).toContain(sample[0]);
      expect(array).toContain(sample[1]);
      expect(sample[0]).not.toBe(sample[1]);
      expect(array).toEqual([1, 2, 3, 4, 5]);
    });

    it('returns an empty array if array is empty', function () {
      expect(_.sample([], 1)).toEqual([]);
    });

    it('returns an empty array if n <= 0', function () {
      expect(_.sample([], 0)).toEqual([]);
      expect(_.sample([], -1)).toEqual([]);
    });

    it('returns array if n >= the size of array', function () {
      expect(_.sample([1, 2, 3], 4)).toEqual([1, 2, 3]);
    });
  });
});
