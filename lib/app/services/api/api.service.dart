import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'http://localhost:9090/api';
  // final _baseUrl = 'http://192.168.0.245:9000/api';

  // Get all systems
  Future<Response> all() async {
    Response response;

    try {
      response = await _dio.get('$_baseUrl/systems');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Get single system
  Future<Response> single(String id) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/systems/$id');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Update system
  Future<Response> update(String id, dynamic data) async {
    Response response;

    try {
      response = await _dio.patch('$_baseUrl/systems/$id', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Create system
  Future<Response> create(dynamic data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/systems', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Restart systems
  Future<Response> reset() async {
    Response response;

    try {
      response = await _dio.get('$_baseUrl/systems/reset');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Login
  Future<Response> login(dynamic data) async {
    Response response;

    try {
      response = await _dio.post('$_baseUrl/auth/login', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
