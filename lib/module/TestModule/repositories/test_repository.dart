import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/model/home_response.dart';
import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';

abstract class TestRepository {
  Stream<List<HomeResponse>> getData();
}

class TestRepositoryImpl extends BaseRepository<TestRemoteSource>
    with TestRepository {
  @override
  Stream<List<HomeResponse>> getData() {
    return remoteSource.getData().trackData();
  }
}
