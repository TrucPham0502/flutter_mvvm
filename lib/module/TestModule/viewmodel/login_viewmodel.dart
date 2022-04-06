import 'package:mvvm/core/core.dart';

class LoginViewModelInput {}

class LoginViewModelOutput {}

class LoginViewModel
    extends BaseViewModel<LoginViewModelInput, LoginViewModelOutput> {
  @override
  LoginViewModelOutput transform(LoginViewModelInput input) {
    return LoginViewModelOutput();
  }
}
