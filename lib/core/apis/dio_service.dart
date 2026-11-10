import 'package:dio/dio.dart';

class DioService {
  final Dio _dioService = Dio();
  Future<Response> getUrl(String endPoint) async {
    try {
      final Response response = await _dioService.get(endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
