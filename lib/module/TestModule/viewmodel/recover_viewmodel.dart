import 'package:mvvm/core/core.dart';

import '../../../core/base/base_viewmodel.dart';

class RecoverViewModelInput {}

class RecoverViewModelOutput {}

class RecoverViewModel
    extends BaseViewModel<RecoverViewModelInput, RecoverViewModelOutput> {
  @override
  RecoverViewModelOutput transform(RecoverViewModelInput input) {
    return RecoverViewModelOutput();
  }
}
