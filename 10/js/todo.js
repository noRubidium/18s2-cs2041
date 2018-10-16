(function() {
  let state = { inputValue: '', todos: [] };

  const genId = index => `todo-list-item-${index}`;

  function renderOneItem(id, todo) {
    const pastItem = document.getElementById(genId(id));
    const item = pastItem ? pastItem : document.createElement('li');
    item.classList.add('list-group-item');
    item.id = genId(id);
    const todoText = document.createTextNode(todo);
    item.innerHTML = '';
    item.appendChild(todoText);
    return pastItem ? null : item;
  }

  function render() {
    const { inputValue, todos } = state;
    const inputBox = document.getElementById('todo-input');
    inputBox.value = inputValue;
    renderOneItem(0, inputValue || 'Example todo item: Cry');

    const todoList = document.getElementById('todo-list');
    todos.map((todo, index) => {
      const itemToAppend = renderOneItem(index + 1, todo);
      itemToAppend && todoList.append(itemToAppend);
    });
  }

  function setState(newState) {
    state = {...state, ...newState};
    render();
  }

  const form = document.getElementById('todo-form');
  form.addEventListener('submit', () => {
    setState({
      inputValue: '',
      todos: [state.inputValue, ...state.todos]
    });
  });
  const input = document.getElementById('todo-input');
  input.addEventListener('input', (event) => {
    setState({inputValue: event.target.value});
  })
}());
