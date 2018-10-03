// Generator
function* gen(){
  let a = 0;
  while (a < 3) {
    yield a++;
  }
  while (a >= 0) {
    yield a--;
  }
}

const it = gen();
console.log(it.next());
console.log(it.next());
console.log(it.next());
console.log(it.next());
console.log(it.next());
console.log(it.next().value);
console.log(it.next().value);
console.log(it.next().value);
console.log(it.next().value);
console.log(it.next().value);
