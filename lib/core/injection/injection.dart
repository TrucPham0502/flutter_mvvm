import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

abstract class InjectionModule {
  void register(GetIt getIt);
}

class Injection {
  static void registerModule(List<InjectionModule> modules) async {
    for (var element in modules) {
      element.register(getIt);
    }
  }
}
