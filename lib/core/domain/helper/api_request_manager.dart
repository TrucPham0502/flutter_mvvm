import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiManager {
  static Dio createDio() {
    final dio = Dio();
    dio.options.baseUrl = dotenv.env["API_ENDPOINT"] as String;
    dio.interceptors.add(ApiInterceptors(dio: dio));
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.headers['Content-Type'] = 'application/json';
    // if (AppConstants.qcEnv == dotenv.env[AppConstants.nameEnv]) {
    //   dio.options.headers['Ocp-Apim-Subscription-Key'] =
    //       '13770a49b6274b2da166a3d220006ad5';
    //   dio.options.headers['Api-Version'] = 'v1';
    // }

    // dio.options.headers['Accept'] = 'text/json';
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true
    ));
    return dio;
  }
}

class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors({required this.dio});

  final Dio dio;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }


  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

   
  }
}
