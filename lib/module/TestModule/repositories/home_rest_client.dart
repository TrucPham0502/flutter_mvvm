import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm/core/core.dart';
import 'package:retrofit/http.dart';

import '../../../core/domain/model/api_response.dart';
import '../model/home_response.dart';

part 'home_rest_client.g.dart';

@lazySingleton
@RestApi()
abstract class HomeRestClient {
  @factoryMethod
  factory HomeRestClient(Dio dio) = _HomeRestClient;

  @GET("/home")
  Stream<ApiListResponse<FoodCategory>> getData();

  @POST("/api/sme/CameraSetting")
  Stream<ApiResponse<HomeResponse>> getData1();
}
