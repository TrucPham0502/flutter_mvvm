import 'package:mvvm/core/base/base_viewmodel.dart';

class DetailViewModelInput {}

class DetailViewModelOutput {}

class DetailViewModel
    extends BaseViewModel<DetailViewModelInput, DetailViewModelOutput> {
  @override
  DetailViewModelOutput transform(DetailViewModelInput input) {
    return DetailViewModelOutput();
  }
}
