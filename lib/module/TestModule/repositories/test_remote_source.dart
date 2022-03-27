import 'package:mvvm/core/core.dart';
import '../model/home_response.dart';

abstract class TestRemoteSource extends BaseRemoteSource {
  Stream<ApiResponse<List<HomeResponse>>> getData();
}

class TestRemoteSourceImpl extends TestRemoteSource {
  @override
  Stream<ApiResponse<List<HomeResponse>>> getData() {
    return ApiRequestManager.request<ApiResponse<List<HomeResponse>>>(
        method: ApiMethod.post,
        url: "https://6078f08ee7f4f50017184eca.mockapi.io/api/sme/access-list",
        convert: (p0) => ApiResponse.fromJson(
            p0, (p1) => iterableToList(p1, (p3) => HomeResponse.fromJson(p3))));
  }
}
