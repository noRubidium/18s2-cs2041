const form = document.getElementById('todo-form');
form.addEventListener('submit', (e) => {
  const inputBox = document.getElementById('todo-input');
  const todoList = document.getElementById('todo-list');
  const newItem = document.createElement('li');
  newItem.classList.add('list-group-item');
  const todoText = document.createTextNode(inputBox.value);
  newItem.appendChild(todoText);
  todoList.appendChild(newItem);
  inputBox.value = '';
  const futureItem = document.getElementById('todo-list-item-0');
  futureItem.innerHTML = 'Example todo item: Cry';
});
const input = document.getElementById('todo-input');
input.addEventListener('input', (event) => {
  const value = event.target.value;
  const futureItem = document.getElementById('todo-list-item-0');
  futureItem.innerHTML = '';
  const todoText = document.createTextNode(value);
  futureItem.appendChild(todoText);
});
