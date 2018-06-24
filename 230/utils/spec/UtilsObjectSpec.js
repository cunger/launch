describe('_', function () {
  it('provides object functionality for objects', function () {
    expect(typeof _({}).keys).toBe('function');
    expect(typeof _({}).values).toBe('function');
    expect(typeof _({}).has).toBe('function');
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

    it('returns false if the object does not containt the key prop', function () {
      expect(_({a: 1, b: 2, c: 3}).has('e')).toBe(false);
      expect(_({}).has('a')).toBe(false);
    });
  });
});
