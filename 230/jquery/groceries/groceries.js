$(document).ready(function () {
  var list = $('#groceries-list');

  $('#add-item').submit(function (event) {
    event.preventDefault();

    var field_name = $('#name');
    var field_quantity = $('#quantity');

    var text = (field_quantity.val() || '1') + ' ' + field_name.val();

    var text_node = $(document.createTextNode(text));
    var item_node = $(document.createElement('li'));
    item_node.append(text_node);
    list.append(item_node);

    this.reset();
    field_quantity.focus();
  });
});
