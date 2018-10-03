// Strings
"hi"
'hi'
function haha() {
  console.log(a);
  var c = 4;
}

console.log(c);
console.log(a);
console.log(b);
a = 1;
var b = 2;
const haha = 23;
const h = {};
h['a'] = 11;
haha++; // error
let ahah = 42;
console.log(`haha ${haha}`);
console.error();

// Numbers
// Arrays
map
filter
reduce
arr.reduce(function (acc, element) {
  return acc + element;
}, 0);

function f(e) {
  return e % 2;
}

arr.filter(f); -> [1,3]

arr.reduce(function (acc, element) {
  return f(element) ? [element, ...acc] : acc;
}, []);


// Objects
