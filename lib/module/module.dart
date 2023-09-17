import 'package:get_it/get_it.dart';
import 'package:mvvm/core/injection/injection.dart';
import 'package:mvvm/module/TestModule/test_module.dart';

import '../core/domain/helper/api_request_manager.dart';
import 'TestModule/repositories/home_rest_client.dart';

class AppModule extends InjectionModule{
  @override
  register(GetIt getIt) {
    getIt.registerLazySingleton(() => HomeRestClient(ApiManager.createDio()));
    getIt.addModule(TestModule());
  }
}
