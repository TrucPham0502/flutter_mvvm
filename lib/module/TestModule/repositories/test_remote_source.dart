
import 'package:mvvm/module/TestModule/repositories/home_rest_client.dart';
import '../../../core/domain/model/api_response.dart';
import '../model/home_response.dart';

abstract class TestRemoteSource {
  Stream<ApiListResponse<FoodCategory>> getData();
  Stream<ApiResponse<HomeResponse>> getData1();
}

class TestRemoteSourceImpl extends TestRemoteSource {
  final HomeRestClient restClient;

  TestRemoteSourceImpl({required this.restClient });
  @override
  Stream<ApiListResponse<FoodCategory>> getData() {
    return restClient.getData();
  }
  
  @override
  Stream<ApiResponse<HomeResponse>> getData1() {
    return restClient.getData1();
  }
}
