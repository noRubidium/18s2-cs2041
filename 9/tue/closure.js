function closureFunction() {
  let a = 0;
  return () => a++;
}
const counter = closureFunction();

console.log(counter());
console.log(counter());
console.log(counter());
console.log(counter());
console.log(counter());
console.log(counter());
