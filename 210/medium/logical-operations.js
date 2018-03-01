console.log(false && undefined);                           // false
console.log(false || undefined);                           // undefined
console.log((false && undefined) || (false || undefined)); // undefined
console.log((false || undefined) || (false && undefined)); // false
console.log((false && undefined) && (false || undefined)); // false
console.log((false || undefined) && (false && undefined)); // undefined
console.log('a' || (false && undefined) || '');            // 'a'
console.log((false && undefined) || 'a' || '');            // 'a'
console.log('a' && (false || undefined) && '');            // undefined
console.log((false || undefined) && 'a' && '');            // undefined
