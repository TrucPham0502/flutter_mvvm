import 'package:injectable/injectable.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';

abstract class TestRepository {
  Stream<List<HomeResponse>> getData();
  Stream<HomeResponse> getData1();
}

@Injectable(as: TestRepository)
class TestRepositoryImpl extends BaseRepository with TestRepository {
  TestRepositoryImpl({required this.remoteSource});
  final TestRemoteSource remoteSource;
  @override
  Stream<List<HomeResponse>> getData() {
    return remoteSource.getData().trackData();
  }
  
  @override
  Stream<HomeResponse> getData1() {
    return remoteSource.getData1().trackData();
  }
}
