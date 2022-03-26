import 'package:mvvm/module/TestModule/model/home_response.dart';

import '../../../core/domain/helper/api_request_manager.dart';
import '../../../core/domain/model/api_response.dart';
import '../../../core/error/error.dart';

abstract class HomeService {
  Stream<List<HomeResponse>> getData();
}

class HomeServiceImpl extends HomeService {
  @override
  Stream<List<HomeResponse>> getData() {
    return ApiRequestManager.request<ApiResponse<List<HomeResponse>>>(
        method: ApiMethod.post,
        url: "https://6078f08ee7f4f50017184eca.mockapi.io/api/sme/access-list",
        convert: (p0) => ApiResponse.fromJson(
            p0,
            (p1) => ApiRequestManager.iterableToList(
                p1, (p3) => HomeResponse.fromJson(p3)))).map((event) {
      if (event.resultCode == ApiResponse.Success) {
        return event.data;
      } else {
        throw ApiError(message: event.message, code: event.resultCode);
      }
    });
  }
}
