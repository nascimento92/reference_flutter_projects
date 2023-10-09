import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _CounterBase with _$Counter;

abstract class _CounterBase with Store {
  _CounterBase() {
    autorun((_) => print(value));
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
