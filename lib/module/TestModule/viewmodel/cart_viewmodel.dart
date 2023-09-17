
import 'package:mvvm/core/rx/activity_indicator.dart';
import 'package:mvvm/core/rx/disposable_widget.dart';
import 'package:mvvm/core/rx/error_tracker.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/base/base_viewmodel.dart';
import '../../../core/rx/stream.dart';

class CartPageInput {
  final Stream stateLoaded;
  CartPageInput(this.stateLoaded);
}

class CartPageOutput {
  BehaviorProperty<List<CartPageModel>> items;
  CartPageOutput(this.items);
}

class CartPageModel {
  final String image;
  final String name;
  final double price;
  final int quantity;
  CartPageModel(this.image, this.name, this.price, this.quantity);
}

class CartPageViewModel extends BaseViewModel<CartPageInput, CartPageOutput> {
  BehaviorProperty<List<CartPageModel>> items =
      BehaviorProperty<List<CartPageModel>>([]);
  @override
  CartPageOutput transform(CartPageInput input) {
    input.stateLoaded
        .flatMap((value) => getData())
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .drive(items)
        .canceledBy(this);
    return CartPageOutput(items);
  }

  Stream<List<CartPageModel>> getData() {
    return Stream.value([
      CartPageModel(Assets.images.pizza1.path, "Primavera Pizza", 5.99, 1),
      CartPageModel(Assets.images.pizzaPng.path, "Cheese Pizza", 6.99, 2),
      CartPageModel(Assets.images.salad.path, "Healthy Salad", 7.99, 1),
    ]).delay(const Duration(seconds: 1));
  }
}
