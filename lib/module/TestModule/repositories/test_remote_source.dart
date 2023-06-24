import 'package:injectable/injectable.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/repositories/home_rest_client.dart';
import '../model/home_response.dart';

abstract class TestRemoteSource {
  Stream<ListResponse<HomeResponse>> getData();
  Stream<ApiResponse<HomeResponse>> getData1();
}

@Injectable(as: TestRemoteSource)
class TestRemoteSourceImpl extends TestRemoteSource {
  final HomeRestClient restClient;

  TestRemoteSourceImpl(this.restClient);
  @override
  Stream<ListResponse<HomeResponse>> getData() {
    return restClient.getData();
  }
  
  @override
  Stream<ApiResponse<HomeResponse>> getData1() {
    return restClient.getData1();
  }
}
