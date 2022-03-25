import 'package:mvvm/data_model.dart';

import 'api_manage.dart';

abstract class Service {
  Stream<List<Album>> getData();
}

class ServiceImpl extends Service {
  @override
  Stream<List<Album>> getData() {
    return fetchAlbum();
  }
}
