import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '';

  @observable
  bool isInvisiblePass = true;

  @observable
  String password = '';

  @observable
  bool loading = false;

  @action
  void setEmail(String pEmail) => email = pEmail;

  @action
  void setPassword(String pPass) => password = pPass;

  @action
  void setPassVisibility() => isInvisiblePass = !isInvisiblePass;

  @action
  Future<void> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2), () {});
    loading = false;
  }

  @computed
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isVisiblePass => isInvisiblePass;

  @computed
  Function get loginPressed =>
      (isEmailValid && isPasswordValid) ? () => login() : () {};
}
