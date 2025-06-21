import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 15),
              receiveTimeout: const Duration(seconds: 15),
            ),
          );

  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}
