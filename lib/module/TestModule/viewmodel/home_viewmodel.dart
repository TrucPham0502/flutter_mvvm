import 'package:mvvm/core/core.dart';
import 'package:mvvm/gen/assets.gen.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/service/home_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModelInput {
  Stream<String> textSearch;
  Stream viewDidApearing;
  HomeViewModelInput(this.textSearch, this.viewDidApearing);
}

class HomeViewModelOutput {
  Stream<List<HomeResponse>> items;
  BehaviorProperty<List<FoodCategory>> foodCategoryitems;
  final BehaviorProperty<List<PopularFoodList>> popularFoodItems;
  HomeViewModelOutput(
      this.items, this.foodCategoryitems, this.popularFoodItems);
}

class DataHomeResult {
  List<FoodCategory> foodCategoryitems;
  List<PopularFoodList> popularFoodItems;
  DataHomeResult(this.foodCategoryitems, this.popularFoodItems);
}

class HomeViewModel
    extends BaseViewModel<HomeViewModelInput, HomeViewModelOutput> {
  final BehaviorProperty<List<HomeResponse>> items =
      BehaviorProperty<List<HomeResponse>>([]);
  final BehaviorProperty<List<FoodCategory>> foodCategoryItems =
      BehaviorProperty<List<FoodCategory>>([]);
  final BehaviorProperty<List<PopularFoodList>> popularFoodItems =
      BehaviorProperty<List<PopularFoodList>>([]);

  final service = getIt.get<HomeService>();
  Stream<List<HomeResponse>> getData(String text) {
    return service.getData().flatMap((value) {
      if (text.isEmpty) {
        return Stream.value(value);
      }
      return Stream.value(
          value.where((element) => element.title.contains(text)).toList());
    });
  }

  @override
  HomeViewModelOutput transform(HomeViewModelInput input) {
    input.viewDidApearing
        .flatMap((value) => getFoodCategory().flatMap((category) =>
            getPopularFoodList().map((item) => DataHomeResult(category, item))))
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .listen((data) {
      foodCategoryItems.add(data.foodCategoryitems);
      popularFoodItems.add(data.popularFoodItems);
    }).canceledBy(this);
    // MergeStream([
    //   input.textSearch.debounceTime(const Duration(seconds: 1)),
    //   input.viewDidApearing.map((event) => "")
    // ])
    //     .flatMap((value) {
    //       return service
    //           .getData()
    //           .trackActivity(activityIndicator)
    //           .trackError(errorTracker);
    //     })
    //     .drive(items)
    //     .canceledBy(this);
    return HomeViewModelOutput(
        items.subject, foodCategoryItems, popularFoodItems);
  }

  Stream<List<PopularFoodList>> getPopularFoodList() {
    return Stream.value([
      PopularFoodList(
          image: Assets.images.pizza1.path,
          name: "Primavera Pizza",
          weight: "Weight 540 gr",
          star: 5.0),
      PopularFoodList(
          image: Assets.images.pizzaPng.path,
          name: "Cheese Pizza",
          weight: "Weight 540 gr",
          star: 5.0),
      PopularFoodList(
          image: Assets.images.salad.path,
          name: "Healthy Salad",
          weight: "Weight 540 gr",
          star: 5.0),
      PopularFoodList(
          image: Assets.images.sandwhich.path,
          name: "Grilled Sandwhich",
          weight: "Weight 540 gr",
          star: 5.0),
      PopularFoodList(
          image: Assets.images.chowmin.path,
          name: "Cheese Chowmin",
          weight: "Weight 540 gr",
          star: 5.0),
    ]).delay(const Duration(seconds: 1));
  }

  Stream<List<FoodCategory>> getFoodCategory() {
    return Stream.value([
      FoodCategory(image: Assets.images.pizzaSvg, name: "Pizza"),
      FoodCategory(image: Assets.images.seaFood, name: "Seafood"),
      FoodCategory(image: Assets.images.coke, name: "Soft Drinks"),
      FoodCategory(image: Assets.images.pizzaSvg, name: "Pizza"),
      FoodCategory(image: Assets.images.pizzaSvg, name: "Pizza"),
      FoodCategory(image: Assets.images.pizzaSvg, name: "Pizza"),
    ]).delay(const Duration(seconds: 1));
  }
}
