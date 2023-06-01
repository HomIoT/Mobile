import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

String _baseUrl = 'http://localhost:9090/api';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl),
  );

  // Get all systems
  Future<Response> all(BuildContext context) async {
    Response response;

    String token = Provider.of<AppState>(context, listen: false).getToken;

    _dio.options.headers["Authorization"] = 'Bearer $token';

    try {
      response = await _dio.get('/systems');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Get single system
  Future<Response> single(String id, BuildContext context) async {
    Response response;

    String token = Provider.of<AppState>(context, listen: false).getToken;

    _dio.options.headers["Authorization"] = 'Bearer $token';

    try {
      response = await _dio.post('/systems/$id');

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Update system
  Future<Response> update(String id, dynamic data, BuildContext context) async {
    Response response;

    String token = Provider.of<AppState>(context, listen: false).getToken;

    _dio.options.headers["Authorization"] = 'Bearer $token';

    try {
      response = await _dio.patch('/systems/$id', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Create system
  Future<Response> create(dynamic data, BuildContext context) async {
    Response response;

    String token = Provider.of<AppState>(context, listen: false).getToken;

    _dio.options.headers["Authorization"] = 'Bearer $token';

    try {
      response = await _dio.post('/systems', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }

  // Restart systems
  Future<Response> reset(BuildContext context) async {
    Response response;

    String token = Provider.of<AppState>(context, listen: false).getToken;

    _dio.options.headers["Authorization"] = 'Bearer $token';

    try {
      response = await _dio.get('/systems/reset');

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
      response = await _dio.post('/auth/login', data: data);

      return response;
    } on DioError catch (e) {
      response = e.response!;

      return response;
    }
  }
}
