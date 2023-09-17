
import 'package:mvvm/core/rx/activity_indicator.dart';
import 'package:mvvm/core/rx/disposable_widget.dart';
import 'package:mvvm/core/rx/error_tracker.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/rx/stream.dart';
import '../model/home_response.dart';

class DetailViewModelInput {
  final Stream viewDidAppearing;
  DetailViewModelInput(this.viewDidAppearing);
}

class DetailViewModelOutput {
  final BehaviorProperty<List<Ingredients>> ingredients;
  DetailViewModelOutput(this.ingredients);
}

class DetailViewModel
    extends BaseViewModel<DetailViewModelInput, DetailViewModelOutput> {
  BehaviorProperty<List<Ingredients>> ingredients =
      BehaviorProperty<List<Ingredients>>([]);
  @override
  DetailViewModelOutput transform(DetailViewModelInput input) {
    input.viewDidAppearing
        .flatMap((v) {
          return getData();
        })
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .drive(ingredients)
        .canceledBy(this);
    return DetailViewModelOutput(ingredients);
  }

  Stream<List<Ingredients>> getData() {
    return Stream.value([
      Ingredients(Assets.images.tomato.path),
      Ingredients(Assets.images.onion.path),
      Ingredients(Assets.images.tomato.path),
      Ingredients(Assets.images.onion.path),
      Ingredients(Assets.images.tomato.path),
      Ingredients(Assets.images.onion.path),
    ]);
  }
}
