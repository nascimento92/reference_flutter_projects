import 'package:mobx/mobx.dart';
part 'list_store.g.dart';

class ListStore = _ListStoreBase with _$ListStore;

abstract class _ListStoreBase with Store {
  @observable
  String newTodoTitle = "";

  ObservableList<String> todoList = ObservableList<String>();

  @action
  void setNewTodoTigle(String value) => newTodoTitle = value;

  @action
  void addTodo() => todoList.add(newTodoTitle);

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
