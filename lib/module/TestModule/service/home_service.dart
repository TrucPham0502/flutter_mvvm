import 'package:mvvm/core/base/base_service.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/repositories/test_repository.dart';

abstract class HomeService {
  Stream<List<HomeResponse>> getData();
}

class HomeServiceImpl extends BaseService<TestRepository> with HomeService {
  @override
  Stream<List<HomeResponse>> getData() {
    return repository.getData();
  }
}
