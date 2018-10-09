
function onSubmit() {
  const inputBox = document.getElementById('todo-input');
  const newText = document.createTextNode(inputBox.value);
  console.log(inputBox.value);
  inputBox.value = '';

  // Append item
  const todoList = document.getElementById('todo-list');
  const newItem = document.createElement('li');
  newItem.classList.add('list-group-item');
  newItem.appendChild(newText);
  todoList.prependChild(newItem);

  const nextItem = document.getElementById('todo-list-item-0');
  nextItem.innerHTML = '';


  nextItem.appendChild(document.createTextNode('Example todo item: Cry'));
}

function onInput(e) {
  console.log(e);
  const nextItem = document.getElementById('todo-list-item-0');
  nextItem.innerHTML = '';

  const newText = document.createTextNode(e.target.value);
  nextItem.appendChild(newText);
}

const inputBox = document.getElementById('todo-input');
inputBox.addEventListener('input', onInput);
const form = document.getElementById('todo-form');
form.addEventListener('submit', onSubmit);
