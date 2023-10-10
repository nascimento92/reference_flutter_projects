import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo2/stores/todo_store.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";

  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodoTigle(String value) => newTodoTitle = value;

  @action
  void addTodo(){
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @action
  void deleteTodo(int index){
    todoList.removeAt(index);
  }
  //todoList.add(TodoStore(newTodoTitle));

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
