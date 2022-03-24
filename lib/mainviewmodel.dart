import 'dart:developer';

import 'package:mvvm/Data_Model.dart';
import 'package:mvvm/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';
import 'extension.dart';

class MainViewModelInput {
  Stream<String> textSearch;
  MainViewModelInput(this.textSearch);
}

class MainViewModelOutput {
  Stream<List<DataModel>> items;
  MainViewModelOutput(this.items);
}

class MainViewModel extends BaseViewModel {
  final BehaviorProperty<List<DataModel>> items =
      BehaviorProperty<List<DataModel>>([]);
  Stream<List<DataModel>> getData(String text) {
    final List<DataModel> data = [
      DataModel("hello"),
      DataModel("hello12"),
      DataModel("hello22"),
      DataModel("hello32"),
      DataModel("hello42"),
      DataModel("hello52"),
    ];
    if (text.isEmpty) {
      return Stream.error(
          AppError(message: "textfield is not empty", code: -100));
    }
    final search = data.where((element) => element.title.contains(text));
    return Stream.value(search.toList()).delay(const Duration(seconds: 1));
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
