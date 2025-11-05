import 'package:dio/dio.dart';

class DioClient {
  static Dio instance() {
    final dio = Dio(BaseOptions(
      baseUrl: "https://mvvvip1.defas-fgi.de",
    ));
    return dio;
  }
}