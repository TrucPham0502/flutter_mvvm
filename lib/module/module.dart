import 'package:mvvm/core/core.dart';
import 'package:mvvm/module/TestModule/test_module.dart';

void configureDependencies() {
  Injection.registerModule([TestModule()]);
}
