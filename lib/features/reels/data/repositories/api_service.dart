import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> fetchReels({required int page, int limit = 10}) async {
    final url = 'https://api.ulearna.com/bytes/all?page=$page&limit=$limit&country=United+States';
    final response = await _dio.get(url);
    return response.data;
  }
}
