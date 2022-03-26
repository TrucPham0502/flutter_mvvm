import 'package:mvvm/core/injection/injection.dart';

class BaseService<T extends Object> {
  final repository = getIt.get<T>();
}
