
import '../../../core/base/base_viewmodel.dart';

class RegisterViewModelInput {}

class RegisterViewModelOutput {}

class RegisterViewModel
    extends BaseViewModel<RegisterViewModelInput, RegisterViewModelOutput> {
  @override
  RegisterViewModelOutput transform(RegisterViewModelInput input) {
    return RegisterViewModelOutput();
  }
}
