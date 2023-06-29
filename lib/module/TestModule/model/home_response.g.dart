// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };

FoodCategory _$FoodCategoryFromJson(Map<String, dynamic> json) => FoodCategory(
      (json['foods'] as List<dynamic>)
          .map((e) => PopularFoodList.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$FoodCategoryToJson(FoodCategory instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'foods': instance.foods,
    };

PopularFoodList _$PopularFoodListFromJson(Map<String, dynamic> json) =>
    PopularFoodList(
      name: json['name'] as String,
      image: json['image'] as String,
      weight: json['weight'] as String,
      star: (json['star'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$PopularFoodListToJson(PopularFoodList instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'weight': instance.weight,
      'star': instance.star,
      'price': instance.price,
    };
