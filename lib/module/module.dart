import 'package:mvvm/core/injection/injection.dart';
import 'package:mvvm/module/TestModule/test_module.dart';

void configureDependencies() {
  Injection.registerModule([TestModule()]);
}
