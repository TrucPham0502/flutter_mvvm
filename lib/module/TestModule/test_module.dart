import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';
import 'package:mvvm/module/TestModule/repositories/test_repository.dart';
import 'package:mvvm/module/TestModule/service/home_service.dart';

class TestModule extends InjectionModule {
  @override
  void register(GetIt getIt) {
    getIt.registerFactory<HomeService>(() => HomeServiceImpl());
    getIt.registerFactory<TestRepository>(() => TestRepositoryImpl());
    getIt.registerFactory<TestRemoteSource>(() => TestRemoteSourceImpl());
  }
}
