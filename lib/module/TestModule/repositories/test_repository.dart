
import 'package:mvvm/core/base/base_repository.dart';
import 'package:mvvm/core/rx/stream.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';

abstract class TestRepository {
  Stream<List<FoodCategory>> getData();
  Stream<HomeResponse> getData1();
}

class TestRepositoryImpl extends BaseRepository with TestRepository {
  TestRepositoryImpl({required this.remoteSource});
  final TestRemoteSource remoteSource;
  @override
  Stream<List<FoodCategory>> getData() {
    return remoteSource.getData().validate();
  }
  
  @override
  Stream<HomeResponse> getData1() {
    return remoteSource.getData1().validate();
  }
}
