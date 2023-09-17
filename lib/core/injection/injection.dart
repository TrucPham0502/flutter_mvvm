
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm/core/injection/injection.config.dart';
import '../../module/module.dart';

final getIt = GetIt.instance;
@InjectableInit(  
  initializerName: 'initGetIt', // default  
  preferRelativeImports: true, // default  
  asExtension: false, // default  
)  
void configureDependencies() {

  getIt.addModule(AppModule());
  initGetIt(getIt);
}

abstract class InjectionModule {
  register(GetIt getIt);
}

extension GetX on GetIt {
  void addModule(InjectionModule module) {
    module.register(this);
  }
}