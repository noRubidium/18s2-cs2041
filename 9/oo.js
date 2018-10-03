// this can be confusing
const o = {
   bb: 5,
   f() {
      console.log(this.bb);
   }
};

// // What does this print out
o.f();

// What does this line do
const a = o.f;

What would this print out
a();

const oo = {bb: 'Barry'};

// What does call do and what will it print out?
a.call(oo);

// What does bind do, is f() the same as a()?
const f = a.bind(oo);

// what does this print out
f();
