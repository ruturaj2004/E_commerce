import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../dependency_locator.dart';
import 'app_interceptor.dart';
import 'end_point.dart';

class NetworkService {
  NetworkService() {
    _dio = Dio(
      _getOptions(),
    )..interceptors.addAll({appInterceptor});
  }
  AppInterceptor appInterceptor = getIt();
  late Dio _dio;
  final String _platform = kIsWeb ? "web" : (Platform.isAndroid ? 'Android' : 'IOS');
  final String _baseUrl =  EndPoint.appBaseUrl;

  BaseOptions _getOptions() => BaseOptions(
        headers: _getHeaders(),
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      );

  Map<String, String?> _getHeaders() {
    String? apiKey = '';

    Map<String, String?> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.userAgentHeader: 'dio',
      'api-key': apiKey,
      'platform': _platform,
    };

    /*  UserLogin? userLogin = _secureStorageNotifier.secureStorage.userLogin;
    String accessToken = userLogin?.accessToken ?? '';

    if (accessToken.isNotEmpty) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    } */

    return headers;
  }

  Future<dynamic> getRequest(
    String url, {
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
  }) async {
    _dio.interceptors.addAll(
      {Logging(_dio), appInterceptor},
    );
    Uri endpoint = Uri.https(baseUrl ?? _baseUrl, url, queryParameters);
    Response response = await _dio.getUri(endpoint);
    // Logging(_dio);
    return response.data;
  }

  Future<dynamic> postRequest(
    String url, {
    Map<String, dynamic>? body,
    String? baseUrl,
  }) async {
    _dio.interceptors.addAll(
      {Logging(_dio), appInterceptor},
    );
    Uri endpoint = Uri.https(
      baseUrl ?? _baseUrl,
      url,
    );

    Response response = await _dio.postUri(endpoint, data: body ?? {});

    if (response.data?.isNotEmpty ?? false) {
      return response.data;
    }

    return null;
  }

  Future<dynamic> postFileRequest(
    String url, {
    String? baseUrl,
    required String filePath,
    Function(double progress)? onProgress,
    Map<String, dynamic>? extraBody,
  }) async {
    _dio.interceptors.addAll(
      {Logging(_dio), appInterceptor},
    );
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception("File does not exist");
    }
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: file.uri.pathSegments.last),
    });
    if (extraBody != null) {
      formData.fields.addAll(
        extraBody.entries.map((entry) => MapEntry(entry.key, entry.value.toString())),
      );
    }
    Uri endpoint = Uri.https(
      baseUrl ?? _baseUrl,
      url,
    );

    Response response = await _dio.postUri(endpoint, data: formData);

    if (response.data?.isNotEmpty ?? false) {
      return response.data;
    }

    return null;
  }

  Future<dynamic> putRequest(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    _dio.interceptors.addAll(
      {Logging(_dio), appInterceptor},
    );
    Uri endpoint = Uri.https(_baseUrl, url);
    Response response = await _dio.putUri(endpoint, data: body ?? {});

    return response.data;
  }

  Future<dynamic> deleteRequest(String url) async {
    _dio.interceptors.addAll(
      {Logging(_dio), appInterceptor},
    );
    Uri endpoint = Uri.https(_baseUrl, url);
    Response response = await _dio.deleteUri(endpoint);
    return response.data;
  }
}
