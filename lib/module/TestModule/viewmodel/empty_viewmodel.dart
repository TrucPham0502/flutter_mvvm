import 'package:mvvm/core/core.dart';

class EmptyPageInput {}

class EmptyPageOutput {}

class EmptyPageViewModel
    extends BaseViewModel<EmptyPageInput, EmptyPageOutput> {
  @override
  EmptyPageOutput transform(EmptyPageInput input) {
    return EmptyPageOutput();
  }
}
