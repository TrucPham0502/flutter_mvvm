import 'package:mvvm/core/base/base_remote_source.dart';
import 'package:mvvm/core/domain/model/api_response.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';

import '../../../core/domain/helper/api_request_manager.dart';

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
