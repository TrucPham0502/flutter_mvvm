import 'package:mvvm/module/TestModule/model/home_response.dart';

import '../../../core/domain/helper/api_request_manager.dart';

abstract class HomeService {
  Stream<List<HomeResponse>> getData();
}

class HomeServiceImpl extends HomeService {
  @override
  Stream<List<HomeResponse>> getData() {
    return ApiRequestManager.request(
        method: ApiMethod.get,
        url: "https://jsonplaceholder.typicode.com/photos",
        convert: (p0) => ApiRequestManager.convertToList<HomeResponse>(
            p0, (p1) => HomeResponse.fromJson(p1)));
  }
}
