const genId = (i) => `todo-list-item-${i}`;

class State {
  constructor() {
    this.state = { currentItem: '', todos: [] };
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

  addElement() {
    const { currentItem, todos } = this.state;
    if (!currentItem) return;
    this.setState({
      todos: [currentItem, ...todos],
      currentItem: ''
    });
  }

  removeElement (id) {
    return function () {
      this.state.todos.splice(id, 1);
      this.render();
    };
  }

  render() {
    const list = document.getElementById('todo-list');
    const input = document.getElementById('todo-input');
    const { currentItem, todos } = this.state;

    input.value = currentItem;
    const curr = this.renderItem(currentItem || 'Example todo item: Cry', 0);
    list.appendChild(curr);
    todos.map((item, i) => {
      const mappedItem = this.renderItem(item, i + 1);
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
