import 'package:mvvm/core/rx/activity_indicator.dart';
import 'package:mvvm/core/rx/disposable_widget.dart';
import 'package:mvvm/core/rx/error_tracker.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/service/home_service.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/injection/injection.dart';
import '../../../core/rx/stream.dart';

class HomeViewModelInput {
  Stream<String> textSearch;
  HomeViewModelInput(this.textSearch);
}

class HomeViewModelOutput {
  Stream<List<HomeResponse>> items;
  HomeViewModelOutput(this.items);
}

class HomeViewModel extends BaseViewModel {
  final BehaviorProperty<List<HomeResponse>> items =
      BehaviorProperty<List<HomeResponse>>([]);
  final service = getIt.get<HomeService>();
  Stream<List<HomeResponse>> getData(String text) {
    return service.getData();
  }

  HomeViewModelOutput transform(HomeViewModelInput input) {
    input.textSearch.debounceTime(const Duration(seconds: 1)).flatMap((value) {
      return getData(value)
          .trackActivity(activityIndicator)
          .trackError(errorTracker);
    }).listen((event) {
      items.add(event);
    }).canceledBy(this);
    return HomeViewModelOutput(items.subject);
  }
}
