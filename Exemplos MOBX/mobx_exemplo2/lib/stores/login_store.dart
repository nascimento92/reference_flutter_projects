import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool visiblePass = true;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(em) => email = em;

  @action
  void setPass(pass) => password = pass;

  @action
  void setVisiblePass() => visiblePass = !visiblePass;

  @action
  Future<void> login() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    isLoggedIn = true;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get validations => isPasswordValid && isEmailValid && !isLoading;
}
