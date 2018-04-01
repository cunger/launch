function makeCollection() {
  return {
    elements: [],

    addElement: function (element) {
      this.elements.push(element);
    },
    addElements: function (elements) {
      elements.forEach(element => this.addElement(element));
    },
  };
}

var coll = makeCollection();
coll.addElements([1, 2, 3]);

console.log(coll.elements);
