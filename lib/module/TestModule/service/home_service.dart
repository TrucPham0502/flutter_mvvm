
import 'package:mvvm/core/base/base_service.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/repositories/test_repository.dart';


abstract class HomeService {
  Stream<List<FoodCategory>> getData();
  Stream<HomeResponse> getData1();
}

class HomeServiceImpl extends BaseService with HomeService {
  HomeServiceImpl({required this.repository});
  final TestRepository repository;
  @override
  Stream<List<FoodCategory>> getData() {
    return repository.getData();
  }
  
  @override
  Stream<HomeResponse> getData1() {
    return repository.getData1();
  }
}
