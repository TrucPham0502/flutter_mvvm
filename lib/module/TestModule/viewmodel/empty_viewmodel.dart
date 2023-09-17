
import '../../../core/base/base_viewmodel.dart';

class EmptyPageInput {}

class EmptyPageOutput {}

class EmptyPageViewModel
    extends BaseViewModel<EmptyPageInput, EmptyPageOutput> {
  @override
  EmptyPageOutput transform(EmptyPageInput input) {
    return EmptyPageOutput();
  }
}
