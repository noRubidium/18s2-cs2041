// Numbers
// Variables
const x = '20';
console.log('x', x + 2);
let a = 10;
a++;
console.log(a);
// Strings
'akjjj '
"s,dfaskd $haha"
console.log('a', `sdfkjasdf ${a}`);
// Functions
function addOne(a) {
  return a + 1;
}
console.log('a', `A + 1 = ${addOne(a)}`);
const f = a => a + 1;
console.log('a', `f(a) = ${f(a)}`);

function loop100Times(f, b) {
  let i = 0;
  while (i < 100) {
    b = f(b);
    i++;
  }
  return b;
}
const t = loop100Times(a => a + 1, 5);
console.log('t', t);
// Arrays
const arr = [0, 1, 2, 3, 4, 5, 6];
const newArr = arr.map(a => a + 1);// => [2;3]
console.log('newArr', newArr);
console.log('arr', arr);
let sum = 0;
for (const n of arr) {
  console.log('n', n);
  sum += n;
}
const sumReduce = arr.reduce((acc, e) => acc + e, 0);
console.log('sum', sum);
console.log('sumReduce', sumReduce);
const filteredArr = arr.filter(e => e % 2);
console.log('filteredArr', filteredArr);
Array.prototype.myFilter = function (f) {
  return this.reduce((acc, e) => f(e) ? [...acc, e] : acc, []);
}
const myFilteredArr = arr.myFilter(e => e % 2);
console.log('myFilteredArr', myFilteredArr);
// Objects
const o = {
  aaa:'blah',
  bb:23
};
console.log('o', o);
console.log('o.aaa', o.aaa);
console.log('o[\'aaa\']', o['aaa']);
o['cc'] = 'haha';
console.log('o', o);
// const
