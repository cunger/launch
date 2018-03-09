var firstName = 'Effi';
var lastName  = 'Briest';
var fullName  = firstName + ' ' + lastName;

console.log(fullName);
console.log(firstName.concat(lastName));
console.log(fullName.split(' '));

var language = 'JavaScript';
var idx = language.indexOf('S');
var charCode = language.charCodeAt(idx);

console.log(idx);
console.log(charCode);
console.log(String.fromCharCode(charCode));
console.log(language.lastIndexOf('a'));

var a = 'a';
var b = 'b';

console.log(a < b);

b = 'B';

console.log(a < b);

var aIndex = language.indexOf('a');
var vIndex = language.indexOf('v');

console.log(language.substr(aIndex, 4));
console.log(language.substr(vIndex, 4));

console.log(language.substring(aIndex, 4));
console.log(language.substring(vIndex, 4));

var fact1 = 'JavaScript is fun';
var fact2 = 'Kids like it too';

var compoundSentence = fact1 + ' and ' + (fact2[0].toLowerCase() + fact2.slice(1));

console.log(compoundSentence);

console.log(fact1.slice(4));
console.log(fact1.substr(4));
console.log(fact1.substring(4));

console.log(fact1[0]);
console.log(fact2[0]);

var pi = 22 / 7;

console.log(pi.toString());
console.log(pi.toString().lastIndexOf('14'));

var boxNumber = (356).toString();
console.log(boxNumber);

boxNumber = parseInt(boxNumber, 10);
console.log(typeof boxNumber);

boxNumber = String(boxNumber);
console.log(typeof boxNumber);

var name = prompt('What is your name?');

if (name.endsWith('!')) {
  name = name.slice(0, -1);
  alert('HELLO ' + name.toUpperCase() + '. WHY ARE WE SCREAMING?');
} else {
  alert('Hello ' + name + '.');
}
