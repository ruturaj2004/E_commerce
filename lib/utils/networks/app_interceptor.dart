import 'dart:developer';
import 'package:dio/dio.dart';

import 'end_point.dart';


enum RefreshTokenStatus { active, expired, fail, pending }

enum ErrorCheckResults { end, retry, next, renewSession }

class AppInterceptor extends Interceptor {
  AppInterceptor(
    this._baseUrl,
  );

  final String _baseUrl;

  /*final Dio _retryDio = Dio();
  Dio? _dioWithCookies;
  bool _isRefreshAccessTokenPending = false; */

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
 //   String? authorization = GetStorage().read(LocalStorageKeyStrings.authToken);
    //options.headers[HttpHeaders.authorizationHeader] = authorization;
    handler.next(options);
    // log()
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // _updateLocalRefreshToken(response: response);
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    Response? response = err.response;
    if (err.response?.statusCode == 401) {
      String? newAccessToken;

      // Fetch login response from storage
     // Map<String, dynamic> loginResp = GetStorage().read(LocalStorageKeyStrings.loginResp)??{};
      // if (loginResp.isEmpty) {
      //   logout();
      //   return;
      // }

//      final loginResponse = LoginResponse.fromJson(loginResp);
      // final loginTime = DateTime.parse(loginResponse.response?.loginTime ?? '${DateTime.now()}');
      // final refreshExpiresIn = loginResponse.response?.refreshExpiresIn ?? 0;

      // Check if refresh token is expired
      // if (DateTime.now().difference(loginTime).inMinutes > refreshExpiresIn) {
      //   logout();
      //   return;
      // }

      //newAccessToken = await onRequireRefreshAccessToken(response, loginResponse.response?.refreshToken ?? '');

      try {
        // Prepare refreshed request
        final requestOptions = err.response!.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

        final dioRefresh = Dio(
          BaseOptions(
            baseUrl: requestOptions.baseUrl,
            headers: <String, String>{'accept': 'application/json'},
          ),
        );

        final response = await dioRefresh.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: requestOptions.headers,
          ),
        );

        return handler.resolve(response);
      } on DioException catch (e) {
        if (e.response?.statusCode == 401) {
         // logout();
        }
      }
    }

    // if(err.type)
    handler.next(err);
  }

  Future<String?> onRequireRefreshAccessToken(Response? response, String refreshToken) async {
    try {
      String? accessToken;
      const refreshTokenUrl = EndPoint.refreshTokenUrl;
      Uri uri = Uri.https(_baseUrl, refreshTokenUrl);
      final resp = await Dio().postUri(uri, data: {'refreshToken': refreshToken});
      // final LoginResponse loginResponse = LoginResponse.fromJson(resp.data);
      // AuthStorageHelper.saveTokenPreferences(loginResponse);
      //accessToken = loginResponse.response?.accessToken;
      return accessToken;
    } catch (e) {
      log('$e');
    }
    return '';
  }
}

// logout() async {
//   await GetStorage().erase();
//   get_x.Get.delete<BottomNavBarController>(force: true);
//   LocalStorageKeyStrings.appNavKey.currentContext!.go('/');
// }

class Logging extends Interceptor {
  final Dio dio;

  Logging(this.dio);

  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   ApiLogger.logDioRequest(options);
  //   return super.onRequest(options, handler);
  // }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   ApiLogger.logDioResponse(response);
  //   return super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   ApiLogger.logDioError(err);
  //   return super.onError(err, handler);
  // }
}
