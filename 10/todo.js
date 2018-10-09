(function() {
  let state = {userInput: '', todos: []};
const constructId = index => `todo-list-item-${index}`;
// id -> 0,1,2,3,4
function displayTodoItem(todoContent, index) {
  const id = constructId(index);
  console.log('id', id);
  const prevElement = document.getElementById(id);
  // Eleemnt does exist
  const todoTextNode = document.createTextNode(todoContent);

  if (prevElement) {
    prevElement.innerHTML = '';
    prevElement.appendChild(todoTextNode);
    return null;
  } else {
    const newTodo = document.createElement('li');
    newTodo.classList.add('list-group-item');
    newTodo.id = id;
    newTodo.appendChild(todoTextNode);
    return newTodo;
  }
}
function afterStateSet() {
  const inputBox = document.getElementById('todo-input');
  inputBox.value = state.userInput;
  displayTodoItem(state.userInput || 'Example todo item: Cry', 0);
  const todoList = document.getElementById('todo-list');

  state.todos.map((todo, i) => {
    const e = displayTodoItem(todo, i + 1);
    if (e) todoList.appendChild(e);
  });
}

function setState(newState) {
  const nextState = {...state, ...newState};
  if(nextState === state) return;
  state = nextState;
  afterStateSet();
}

function onSubmit() {
  setState({
    todos: [state.userInput, ...state.todos],
    userInput: ''
  });
}

function onInput(e) {
  setState({userInput: e.target.value});
}

const inputBox = document.getElementById('todo-input');
inputBox.addEventListener('input', onInput);
const form = document.getElementById('todo-form');
form.addEventListener('submit', onSubmit);
})();
