// let's note the power with cleaning some user data.
const users = [
    {
      name: 'Jeff',
      age: 52,
      gender: 'male'
    },
    {
      name: 'Andy',
      age: 25,
      gender: 'male'
    },
    {
      name: 'Sarah',
      age: 30,
      gender: 'female'
    },
    {
      name: 'Phoebe',
      age: 21,
      gender: 'female'
    },
    {
      name: 'Doris',
      age: 81,
      gender: 'female'
    }
];

const maleUsers = users.filter(u => u.gender === 'male');
const maleAgeSum = maleUsers.reduce((sum, user) => {
  return sum + user.age;
}, 0);
const maleAgeAvg = maleAgeSum / maleUsers.length;
console.log(maleAgeAvg);
