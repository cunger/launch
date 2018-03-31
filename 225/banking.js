var Bank = function () {
  let seed = 101;
  let accounts = [];

  return {
    openAccount: function () {
      let newAccount = Account(seed + accounts.length);
      accounts[accounts.length] = newAccount;
      return newAccount;
    },

    transfer: function (source, target, amount) {
      return target.deposit(source.withdraw(amount));
    }
  };
}

var Account = function (number) {
  const id = number;
  let balance = 0;
  let transactions = [];

  return {
    number: function () { return id; },
    balance: function () { return balance; },
    transactions: function () { return transactions; },

    deposit: function (amount) {
      balance += amount;
      transactions.push(Transaction('deposit', amount));
      return amount;
    },
    withdraw: function (amount) {
      let amountToWithdraw = Math.min(balance, amount);
      balance -= amountToWithdraw;
      transactions.push(Transaction('withdraw', amountToWithdraw));
      return amountToWithdraw;
    },
  };
}

var Transaction = function (type, amount) {
  return { type: type, amount: amount };
}

var account = Account();
console.log(account.balance() === 0);
console.log(account.deposit(42) === 42);
console.log(account.balance() === 42);
console.log(account.withdraw(19) === 19);
console.log(account.balance() === 23);
console.log(account.withdraw(24) === 23);
console.log(account.balance() === 0);
console.log(account.transactions());

var bank = Bank();
console.log(bank.accounts === undefined);

var account1 = bank.openAccount();
console.log(account1.number() === 101);
account1.deposit(10);

var account2 = bank.openAccount();
console.log(account2.number() === 102);

console.log(bank.transfer(account1, account2, 7) === 7);
console.log(account1.balance() === 3);
console.log(account2.balance() === 7);
