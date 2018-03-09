function isValidEmail(email) {
  const VALID_EMAIL = /^[a-z0-9]+@([a-z]+\.)+[a-z]+$/i;

  return VALID_EMAIL.test(email);
  // or: return !!email.match(VALID_EMAIL);
}

console.log(isValidEmail('Foo@baz.com.ph') === true);
console.log(isValidEmail('Foo@mx.baz.com.ph') === true);
console.log(isValidEmail('foo@baz.com') === true);
console.log(isValidEmail('foo@baz.ph') === true);
console.log(isValidEmail('HELLO123@baz') === false);
console.log(isValidEmail('foo.bar@baz.to') === false);
console.log(isValidEmail('foo@baz.') === false);
console.log(isValidEmail('foo_bat@baz') === false);
console.log(isValidEmail('foo@bar.a12') === false);
console.log(isValidEmail('foo_bar@baz.com') === false);
console.log(isValidEmail('foo@bar.....com') === false);
