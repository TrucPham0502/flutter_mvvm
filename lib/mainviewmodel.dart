import 'package:mvvm/base_viewmodel.dart';
import 'package:mvvm/data_model.dart';
import 'package:mvvm/injection.dart';
import 'package:rxdart/rxdart.dart';
import 'extension.dart';
import 'service.dart';

class MainViewModelInput {
  Stream<String> textSearch;
  MainViewModelInput(this.textSearch);
}

class MainViewModelOutput {
  Stream<List<Album>> items;
  MainViewModelOutput(this.items);
}

class MainViewModel extends BaseViewModel {
  final BehaviorProperty<List<Album>> items = BehaviorProperty<List<Album>>([]);
  final service = getIt.get<Service>();
  Stream<List<Album>> getData(String text) {
    return service.getData();
  }

  MainViewModelOutput transform(MainViewModelInput input) {
    input.textSearch.debounceTime(const Duration(seconds: 1)).flatMap((value) {
      return getData(value)
          .trackActivity(activityIndicator)
          .trackError(errorTracker);
    }).listen((event) {
      items.add(event);
    }).canceledBy(this);
    return MainViewModelOutput(items.subject);
  }
}
