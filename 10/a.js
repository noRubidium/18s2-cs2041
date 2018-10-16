
const getUserData = async () => {
  try {
    const response = await fetch('http://localhost:5000/users');
    const { users } = await response.json();

    const userInfo = await Promise.all(users.map((uid) => {
        return fetch(`http://localhost:5000/users/${uid}`);
      })
    );

    console.log(userInfo);
  } catch (e) {
    console.error(e);
  }
}
