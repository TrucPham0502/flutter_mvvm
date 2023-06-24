import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:injectable/injectable.dart';
import 'package:mvvm/core/core.dart';
import 'package:mvvm/core/injection/injection.config.dart';
import 'package:mvvm/module/TestModule/repositories/home_rest_client.dart';
import 'package:mvvm/module/TestModule/test_module.dart';

final getIt = GetIt.instance;
@InjectableInit(  
  initializerName: 'initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(
    () => ApiManager.createDio()
  );
  initGetIt(getIt);
}
