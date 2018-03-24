var invoices = {
  unpaid: [],
  paid: [],
};

invoices.add = function (name, amount) {
  this.unpaid.push({
    name: name,
    amount: amount,
  });
};

invoices.totalDue = function () {
  return this.unpaid.reduce((sum, x) => sum + x.amount, 0);
};

invoices.payInvoice = function (name) {
  var index = this.unpaid.findIndex(invoice => invoice.name === name);
  if (index >= 0) {
    this.paid.push(this.unpaid[index]);
    this.unpaid.splice(index, 1);
  }
};

invoices.totalPaid = function () {
  return this.paid.reduce((sum, x) => sum + x.amount, 0);
};

invoices.add('Starbucks', 300);
invoices.add("Due North Development", 250);
invoices.add("Moonbeam Interactive", 187.50);
invoices.add("Slough Digital", 300);

invoices.payInvoice("Starbucks");
