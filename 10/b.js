
Promise -> []

fetch('http://localhost:5000/users')
  .then((response) => {
    return users
  })
  .then((users) => {
    return Promise.all(user.map((user) => fetch(`....${user.id}`)));
  })
  .then(posts => {
    .....
  })

ES7 -> async/await and try catch

async function getComments() {
  try {
    const users = await fetch('httt.....');
    const posts = await Promise.all(users.map(....));
  } catch (e){
    console.log('error', e);
  }
}
