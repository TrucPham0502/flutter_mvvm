import 'package:mvvm/core/core.dart';

class RegisterViewModelInput {}

class RegisterViewModelOutput {}

class RegisterViewModel
    extends BaseViewModel<RegisterViewModelInput, RegisterViewModelOutput> {
  @override
  RegisterViewModelOutput transform(RegisterViewModelInput input) {
    return RegisterViewModelOutput();
  }
}
