import 'package:mvvm/core/core.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:rxdart/rxdart.dart';

class CartPageInput {
  final Stream viewApearing;
  CartPageInput(this.viewApearing);
}

class CartPageOutphut {
  BehaviorProperty<List<CartPageModel>> items;
  CartPageOutphut(this.items);
}

class CartPageModel {
  final String image;
  final String name;
  final double price;
  final int quantity;
  CartPageModel(this.image, this.name, this.price, this.quantity);
}

class CartPageViewModel extends BaseViewModel<CartPageInput, CartPageOutphut> {
  BehaviorProperty<List<CartPageModel>> items =
      BehaviorProperty<List<CartPageModel>>([]);
  @override
  CartPageOutphut transform(CartPageInput input) {
    input.viewApearing
        .flatMap((value) => getData())
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .drive(items)
        .canceledBy(this);
    return CartPageOutphut(items);
  }

  Stream<List<CartPageModel>> getData() {
    return Stream.value([
      CartPageModel(Assets.images.pizza1.path, "Primavera Pizza", 5.99, 1),
      CartPageModel(Assets.images.pizzaPng.path, "Cheese Pizza", 6.99, 2),
      CartPageModel(Assets.images.salad.path, "Healthy Salad", 7.99, 1),
    ]).delay(const Duration(seconds: 1));
  }
}
