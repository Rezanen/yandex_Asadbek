import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@singleton
class ApiBase {
  late Dio _dio;

  ApiBase() {
    init();
  }

  void init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://geocode-maps.yandex.ru/1.x/",
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    );
  }

  Dio get dio => _dio;
}
