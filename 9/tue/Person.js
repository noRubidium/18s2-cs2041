// note the use of this in this special constructor
// also note the caps (a convention for constructor functions)
function Person(firstName, lastName, age) {
   this.firstName = firstName;
   this.lastName  = lastName;
   this.age       = age;
}

Person.prototype.getFullName = function () {
   return `${this.firstName} ${this.lastName}`;
};

Person.prototype.canDrinkAlcohol = function () {
   return this.age >= 18;
};

// now if we call the constructor function we get this
const jeff = new Person('Jeff', 'Goldblum', 50);
// => Person { firstName: 'Jeff', lastName: 'Goldblum', age: 50 }

jeff.getFullName(); // 'Jeff Goldblum'
