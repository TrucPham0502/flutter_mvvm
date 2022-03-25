import 'package:get_it/get_it.dart';
import 'package:mvvm/service.dart';

final getIt = GetIt.instance;
void configureDependencies() async {
  getIt.registerFactory<Service>(() => ServiceImpl());
}
