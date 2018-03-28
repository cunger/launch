// https://launchschool.com/lessons/c9200ad2/assignments/bb359c53

Function.prototype.bind = function () {
  var fn = this;
  var args = Array.prototype.slice.call(arguments);
  var context = args.shift();

  return function () {
    fn.apply(context, args.concat(Array.prototype.slice.call(arguments)));
  };
}
