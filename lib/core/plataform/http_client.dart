import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_flutter/core/plataform/connection_handler.dart';
import 'package:pokedex_flutter/core/plataform/flavor_config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PokeAPI {
  static const String secondUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  static const String baseUrl = "https://pokeapi.co/api/v2/";
}

abstract class HttpClient {
  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool useToken = true});

  Future<Response<dynamic>> post(String path, data,
      {bool useToken = true, Map<String, dynamic>? headers});

  Future<Response<dynamic>> delete(String path,
      {bool useToken = true, Map<String, dynamic>? headers});
}

class HttpClientImpl implements HttpClient {
  final FlavorConfig config;
  final ConnectionHandler connection;
  late BaseOptions _baseOptions;

  HttpClientImpl({
    required this.config,
    required this.connection,
  }) {
    _baseOptions = BaseOptions(
      baseUrl: config.apiUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );
  }

  Future<Dio> _getDio() async {
    var dio = Dio(_baseOptions);
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false));
    }
    return dio;
  }

  @override
  Future<Response<dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool useToken = true}) async {
    try {
      final dio = await _getDio();
      final response = await dio.get(path,
          queryParameters: queryParameters, options: Options(headers: headers));
      return response;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> post(String path, data,
      {bool useToken = true, Map<String, dynamic>? headers}) async {
    try {
      final dio = await _getDio();
      final response =
          await dio.post(path, data: data, options: Options(headers: headers));
      return response;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>> delete(String path,
      {bool useToken = true, Map<String, dynamic>? headers}) async {
    try {
      final dio = await _getDio();
      final response =
          await dio.delete(path, options: Options(headers: headers));
      return response;
    } on DioException {
      rethrow;
    }
  }
}
