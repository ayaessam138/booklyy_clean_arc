import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final BaseUrl = 'https://www.googleapis.com/books/v1/';

  ApiService(
    this.dio,
  );
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get('$BaseUrl$endpoint');
    return response.data;
  }
}
