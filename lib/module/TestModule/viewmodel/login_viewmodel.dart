import 'package:mvvm/module/TestModule/service/home_service.dart';

import '../../../core/base/base_viewmodel.dart';

class LoginViewModelInput {}

class LoginViewModelOutput {}


class LoginViewModel
    extends BaseViewModel<LoginViewModelInput, LoginViewModelOutput> {
  final HomeService service;
  LoginViewModel({required this.service});


  @override
  LoginViewModelOutput transform(LoginViewModelInput input) {
    return LoginViewModelOutput();
  }
}
