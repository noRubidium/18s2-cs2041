function extractTime(s) {
  let r = /(\d+)\s+([ms])/g;
  r = r.exec(s);
  let [num,unit] = r;
  if (unit === "m") num *= 60;
  return num;
}

console.log(extractTime("set timer for 5 minutes"), 300);
console.log(extractTime("set a timer for 10m"), 600);
console.log(extractTime("timer 8minutes"), 480);
console.log(extractTime("new timer 60seconds"), 60);
console.log(extractTime("timer for 60s"), 60);
