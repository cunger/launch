# Promises 

_Promises_ are objects that have a `then` method which takes two (optional) function arguments: 
* a handler that is called when the promise is fulfilled, and 
* a handler that is called when it is rejected. 
The return value of `then` is another promise that is fulfilled when the called handler finishes, and fails when the called handler throws an error. 

```js 
promise.then(onFulfilled, onRejected);
``` 

Syntactic sugar for `then(null, onRejected)`:
```js
promise.cath(onRejected);
```

A promise first goes into a _pending_ state, and then into a _settled_ state, once it resolved to being either _fulfilled_ (with a return value) or _rejected_ (with a reason).

The handler functions need to either return another promise, or return a value if it succeeds or otherwise throw an error.

## Example: get the current position of the client

Without promises:

```js 
navigator.geolocation.getCurrentPosition(
  function (position) {
    console.log('Latitude:  ' + position.coords.latitude); 
    console.log('Longitude: ' + position.coords.longitude);
  }, 
  function (error) {
    console.log(error.message);
  }
);
```

With promises:

```js
function promiseToGetCoordinates() { 
  return new Promise(function (fulfill, reject) {
    navigator.geolocation.getCurrentPosition(
      function (position) { 
	fulfill(position.coords); 
      }, 
      function (error) { 
	reject(error); 
      }
    );
  });
}

promiseToGetCoordinates()
.then(
  function (coordinates) { 
    console.log('(' + coordinates.latitude + ',' + coordinates.longitude + ')'); 
  }, 
  function (error) { 
    console.log(error.message); 
  }
); 
```

## Creating promises

```js 
new Promise(function someCalculation(fulfill, reject) {
  result = // some calculatation 

  if (successful) {
    fulfill(result);
  } else { 
    reject(new Error('Oops.'));
  }
});
```

## Chaining promises

Example:

```js
var data = new FormData();
data.append('key', 'value');

fetch('https://url/update', {
  method: 'POST',
  body: data
}) 
.then(function (response) {
  if (response.ok) return response;
  throw new Error('Fetch failed.');
})
.then(response => response.json)
.then(jsonNode => parse(jsonNode))
.then(json     => process(json)) 
.then(result   => console.log(result) || result) // logs and returns result 
.catch(error   => console.error(error));
```

## Lists of promises

```js
Promise.all([
  promising1,
  promising2,
  promising3
])
.then(allFulfilled, firstRejected);
```

```js
Promise.race([
  promising1,
  promising2,
  promising3
])
.then(firstFulfilled, firstRejected);
```
