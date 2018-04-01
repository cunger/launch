function createInvoice(services = {}) {
  return {
    phone: services.phone || 3000,
    internet: services.internet || 5500,

    total: function () {
      return this.phone + this.internet;
    },

    payments: [],

    addPayment: function (payment) {
      this.payments.push(payment);
    },
    addPayments: function (payments) {
      payments.forEach(payment => this.addPayment(payment));
    },

    amountDue: function() {
      return this.total() - this.payments.reduce((sum, payment) => sum + payment.total(), 0);
    },
  };
}

function invoiceTotal(invoices) {
   var total = 0;
   var i;

   for (i = 0; i < invoices.length; i += 1) {
     total += invoices[i].total();
   }

   return total;
 }

 var invoices = [];
 invoices.push(createInvoice());
 invoices.push(createInvoice({
   internet: 6500,
 }));

 invoices.push(createInvoice({
   phone: 2000,
 }));

 invoices.push(createInvoice({
   phone: 1000,
   internet: 4500,
 }));

 console.log(invoiceTotal(invoices)); // 31000

function createPayment(services = {}) {
  return {
    phone: services.phone || 0,
    internet: services.internet || 0,

    total: function () {
      return services.amount || this.phone + this.internet;
    },
  };
}

function paymentTotal(payments) {
  var total = 0;
  var i;

  for (i = 0; i < payments.length; i += 1) {
    total += payments[i].total();
  }

  return total;
}

var payments = [];
payments.push(createPayment());
payments.push(createPayment({
  internet: 6500,
}));

payments.push(createPayment({
  phone: 2000,
}));

payments.push(createPayment({
  phone: 1000,
  internet: 4500,
}));

payments.push(createPayment({
  amount: 10000,
}));

console.log(paymentTotal(payments)); // 24000

var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
console.log(invoice.payments);
console.log(invoice.amountDue()); // 0
