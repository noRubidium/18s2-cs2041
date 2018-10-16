(function() {
  let state = {userInput: '', todos: []};
const constructId = index => `todo-list-item-${index}`;
// id -> 0,1,2,3,4
function displayTodoItem(todoContent, index) {
  const id = constructId(index);
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

  state.todos.map(({ content }, i) => {
    const e = displayTodoItem(content, i + 1);
    if (e) todoList.appendChild(e);
  });
}

function setState(newState) {
  const nextState = {...state, ...newState};
  if(nextState === state) return;
  state = nextState;
  afterStateSet();
}

async function onSubmit() {
  try {
    const { userInput, todos } = state;
    console.log(userInput);
    const _id = await fetch('http://localhost:5000/todos/add', {
      method: 'POST',
      body: JSON.stringify(userInput),
      headers: {
          'Content-Type': 'application/json'
      }
    });
    setState({
      todos: [{_id, content: userInput}, ...todos],
      userInput: ''
    });
  } catch (e) {
    console.log(e);
  }
}

function onInput(e) {
  setState({userInput: e.target.value});
}

async function onPageLoad() {
  try {
    const response = await fetch('http://127.0.0.1:5000/todos');
    const { todos } = await response.json();
    setState({ todos });
    console.log(todos);
  } catch (e) {
    console.err(e);
  }
}

onPageLoad();
const inputBox = document.getElementById('todo-input');
inputBox.addEventListener('input', onInput);
const form = document.getElementById('todo-form');
form.addEventListener('submit', onSubmit);
})();
