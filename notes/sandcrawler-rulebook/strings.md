
Beware of the subtle differences:
```js
substr(startIndex, numberOfCharacters);
substring(startIndex, exclusiveEndIndex);
slice(startIndex, exclusiveEndIndex); // with slightly different behaviour
```

## Regular expressions

```js
const isUrl = function (string) {
  const URL_REGEX = /^https?:\/\/\S+$/;
  return !!string.match(URL_REGEX);
};
```

Also, `split` can take a regex:
```js
text.split(/[ \t,]/);
```

_Global replace:_
```js
'Mississippi'.replace(/s/g, 'q'); // "Miqqiqqippi"
```

_Capture groups_ use `\n` as back reference within the regex, and `$n` in the replacement string, for example:
```js
text.replace(/(['"]).+\1/, '$1The Time Machine$1'));
```

_Word boundaries:_ Note that `"the big red blubb".match(/\s...\s/g)` finds only one match: ` big `. This is because the space between `g` and `r` has been consumed by that match, so the engine proceeds with `red `, which doesn't match. Check for word boundaries instead: `"the big red blubb".match(/\b...\b/g)` finds three matches: `the`, `big`, and `red`.

_Greedy vs lazy:_ Regex engines are greedy; adding a `?` to a quantifier however makes matching lazy.
For example:
```js
var string = 'a "deal" is a "deal"';

// greedy
string.match(/\".*\"/g)  // ==> one match: '"deal" is a "deal"'
// lazy
string.match(/\".*?\"/g) // ==> two matches: '"deal"', '"deal"'
```
