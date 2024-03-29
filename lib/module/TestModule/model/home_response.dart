import 'package:json_annotation/json_annotation.dart';

import '../../../core/domain/model/api_response.dart';
part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  HomeResponse({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;


factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);


Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}


@JsonSerializable()
class FoodCategory {
  final String image;
  final String name;
  final List<PopularFoodList> foods;
  FoodCategory(this.foods, {required this.image, required this.name});
  factory FoodCategory.fromJson(Map<String, dynamic> json) => _$FoodCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$FoodCategoryToJson(this);
}

@JsonSerializable()
class PopularFoodList {
  final String image;
  final String name;
  final String weight;
  final double star;
  final double price;
  PopularFoodList({
    required this.name,
    required this.image,
    required this.weight,
    required this.star,
    required this.price,
  });
  factory PopularFoodList.fromJson(Map<String, dynamic> json) => _$PopularFoodListFromJson(json);
  Map<String, dynamic> toJson() => _$PopularFoodListToJson(this);
}

class Ingredients {
  final String image;
  Ingredients(this.image);
}


