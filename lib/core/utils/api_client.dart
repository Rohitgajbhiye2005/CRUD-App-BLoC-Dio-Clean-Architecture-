import 'package:dio/dio.dart';
class ApiClient{
  final Dio dio;

  ApiClient({Dio? dio}) : dio = dio??Dio();
  
  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}