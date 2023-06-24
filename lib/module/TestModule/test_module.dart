// import 'package:http/http.dart';
// import 'package:mvvm/core/core.dart';
// import 'package:mvvm/module/TestModule/repositories/test_remote_source.dart';
// import 'package:mvvm/module/TestModule/repositories/test_repository.dart';
// import 'package:mvvm/module/TestModule/service/home_service.dart';

// class TestModule extends InjectionModule {
//   @override
//   void register(GetIt getIt) {
//     getIt.registerFactory<HomeService>(() => HomeServiceImpl(repository: getIt()));
//     getIt.registerFactory<TestRepository>(() => TestRepositoryImpl(remoteSource: getIt()));
//     getIt.registerFactory<TestRemoteSource>(() => TestRemoteSourceImpl());
//   }
// }

// import 'package:injectable/injectable.dart';
// import 'package:mvvm/module/TestModule/service/home_service.dart';

// @module
// abstract class TestModule {
//   @preResolve
//   HomeService get homeService => HomeServiceImpl(repository: repository)
// }