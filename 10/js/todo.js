(function() {
  let state = { inputValue: '', todos: [] };

  const genId = index => `todo-list-item-${index}`;

  function renderOneItem(id, todo, _id) {
    const pastItem = document.getElementById(genId(id));
    const item = pastItem ? pastItem : document.createElement('li');
    item.classList.add('list-group-item');
    item.id = genId(id);
    const todoText = document.createTextNode(todo);
    item.innerHTML = '';
    item.appendChild(todoText);
    if(!pastItem) {
      item.addEventListener('click', () => deleteItem(id - 1, _id));
    }
    return pastItem ? null : item;
  }

  function render() {
    const { inputValue, todos } = state;
    const inputBox = document.getElementById('todo-input');
    inputBox.value = inputValue;
    renderOneItem(0, inputValue || 'Example todo item: Cry');

    const todoList = document.getElementById('todo-list');
    todos.map(({ content, _id }, index) => {
      const itemToAppend = renderOneItem(index + 1, content, _id);
      itemToAppend && todoList.append(itemToAppend);
    });

    let idx = todos.length + 1;
    let toDelete = null;
    while (toDelete = document.getElementById(genId(idx))) {
      toDelete.parentNode.removeChild(toDelete);
      idx++;
    }
  }

  function setState(newState) {
    state = {...state, ...newState};
    console.log(state);
    render();
  }

  async function onSubmit () {
    const { inputValue, todos } = state;
    try {
      const response = await fetch('http://localhost:5000/todos/add', {
        method: 'POST',
        body: JSON.stringify(inputValue),
        headers: {
          'Content-Type': 'application/json'
        }
      });
      const { _id } = await response.json();
      setState({
        inputValue: '',
        todos: [{_id, content: inputValue}, ...todos]
      });
    } catch (e) {
      console.log('error', e);
    }
  }

  const onInput = (event) => {
    setState({inputValue: event.target.value});
  };

  async function deleteItem(id, _id) {
    await fetch(`http://localhost:5000/todos/delete/${_id}`, {
      method: 'POST'
    });
    setState({
      todos: state.todos.filter((_, i) => i !== id)
    });
  }

  const onLoad = async () => {
    // Get todos and set the state to be all my todos
    const response = await fetch('http://localhost:5000/todos');
    const { todos } = await response.json();
    setState({todos});
  }

  const main = () => {
    onLoad();
    const form = document.getElementById('todo-form');
    form.addEventListener('submit', onSubmit);
    const input = document.getElementById('todo-input');
    input.addEventListener('input', onInput);
  }

  main();
}());
