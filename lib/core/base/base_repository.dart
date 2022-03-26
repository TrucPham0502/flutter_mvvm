import 'package:mvvm/core/injection/injection.dart';

class BaseRepository<T extends Object> {
  final remoteSource = getIt.get<T>();
}
