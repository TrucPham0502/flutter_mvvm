import 'package:mvvm/core/core.dart';

class DetailViewModelInput {}

class DetailViewModelOutput {}

class DetailViewModel
    extends BaseViewModel<DetailViewModelInput, DetailViewModelOutput> {
  @override
  DetailViewModelOutput transform(DetailViewModelInput input) {
    return DetailViewModelOutput();
  }
}
