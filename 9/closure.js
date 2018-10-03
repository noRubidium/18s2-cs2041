function closureFunction() {
  let n = 0;
  return () => n++;
}
const counter = closureFunction();

console.log(counter()); // 0
console.log(counter());// 1
console.log(counter());//2
console.log(counter());//3
console.log(counter());
console.log(counter());
