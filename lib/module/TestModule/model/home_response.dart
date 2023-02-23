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

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

class FoodCategory {
  final String image;
  final String name;
  FoodCategory({required this.image, required this.name});
}

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
}

class Ingredients {
  final String image;
  Ingredients(this.image);
}
