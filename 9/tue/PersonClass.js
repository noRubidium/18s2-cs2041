class Person {
  constructor(firstName, lastName, age) {
     this.firstName = firstName;
     this.lastName  = lastName;
     this.age       = age;
  }

  getFullName() {
    return `${this.firstName} ${this.lastName}`;
  }

  canDrinkAlcohol() {
    return this.age >= 18;
  }
}

// now if we call the constructor function we get this
const jeff = new Person('Jeff', 'Goldblum', 50);
// => Person { firstName: 'Jeff', lastName: 'Goldblum', age: 50 }

jeff.getFullName(); // 'Jeff Goldblum'
