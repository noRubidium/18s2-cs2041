const genId = (i) => `todo-list-item-${i}`;

class State {
  constructor() {
    this.state = { currentItem: '', todos: [] };
    this.getTodos();
  }

  async getTodos() {
    try {
      const response = await fetch('http://localhost:5000/todos');
      const data = await response.json();
      console.log(data);
      const { todos } = data;
      this.setState({todos});
    } catch (e) {
      console.log('Err',e);
    }
  }

  setState(newState) {
    const nextState = {...this.state, ...newState};
    if (nextState !== this.state) {
      this.state = nextState;
      this.render();
    }
  }

  renderItem(item, i) {
    const id = genId(i);
    const prev = document.getElementById(id);
    const li = prev || document.createElement('li');
    li.id = id;
    li.className = 'list-group-item';
    li.innerHTML = '';
    const todo = document.createTextNode(item);
    li.appendChild(todo);
    if (i - 1 >= 0) {
      const cross = document.createElement('span');
      cross.classList.add('badge');
      cross.classList.add('badge-primary');
      cross.classList.add('badge-pill');
      cross.classList.add('float-right');
      cross.addEventListener('click', this.removeElement(i - 1).bind(this));
      cross.innerHTML = 'finish';
      li.appendChild(cross);
    }
    return prev ? prev : li;
  }

  changeCurrentTodo(e) {
    this.setState({ currentItem: e.target.value });
  }

  async addElement() {
    const { currentItem, todos } = this.state;
    if (!currentItem) return;
    try {
      const response = await fetch('http://localhost:5000/todos/add',
      {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(currentItem)
      });
      const { _id } = response.json();
      this.setState({
        todos: [{_id, content: currentItem}, ...todos],
        currentItem: ''
      });
    } catch (e) {
      console.log('Err',e);
    }
  }

  removeElement (id) {
    return async () => {
      try {
        const removeId = this.state.todos[id]._id;
        await fetch(`http://localhost:5000/todos/delete/${removeId}`, {
          method: 'POST'
        });
        const { todos } = this.state;
        this.setState({ todos: todos.filter((_, i) => i !== id)});
      } catch (e) {
        console.log('Err',e);
      }
    };
  }

  render() {
    const list = document.getElementById('todo-list');
    const input = document.getElementById('todo-input');
    const { currentItem, todos } = this.state;

    input.value = currentItem;
    const curr = this.renderItem(currentItem || 'Example todo item: Cry', 0);
    list.appendChild(curr);
    console.log(todos);
    todos.map((item, i) => {
      const mappedItem = this.renderItem(item.content, i + 1);
      list.appendChild(mappedItem);
    });

    const toDelete = document.getElementById(genId(todos.length + 1));
    if (toDelete) toDelete.parentNode.removeChild(toDelete);
  }
}

document.addEventListener('DOMContentLoaded', function(event) {
  const state = new State();
  const input = document.getElementById('todo-input');

  input.addEventListener('input', state.changeCurrentTodo.bind(state));

  const form = document.getElementById('todo-form');

  form.addEventListener('submit', state.addElement.bind(state));
});
