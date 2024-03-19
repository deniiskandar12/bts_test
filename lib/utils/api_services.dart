import 'dart:developer';

import 'package:bts_test/constants/api_consts.dart';
import 'package:dio/dio.dart';

class ApiService {
  ApiService._();

  static final ApiService _apiService = ApiService._();

  factory ApiService() {
    return _apiService;
  }

  static const url = ApiConstants.baseUrl;
  static const int timeoutInMiliSeconds = 20000;

  static Dio dioCall({
    int timeOut = timeoutInMiliSeconds,
    String? token,
    String? authorization,
  }) {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token != null) {
      headers['token'] = token;
    }

    if (authorization != null) {
      headers['Authorization'] = "Bearer $authorization";
    }

    var dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: url,
        contentType: "application/json",
        responseType: ResponseType.json,
        connectTimeout: Duration(milliseconds: timeOut),
      ),
    );

    dio.interceptors.add(_authInterceptor());

    return dio;
  }

  static Interceptor _authInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (reqOptions, handler) {
        log('${reqOptions.uri}', name: 'REQUEST URL');
        log('${reqOptions.headers}', name: 'HEADER');

        return handler.next(reqOptions);
      },
      onError: (error, handler) async {
        log(error.message.toString(), name: 'ERROR MESSAGE');
        log('${error.response}', name: 'RESPONSE');

        return handler.next(error);
      },
      onResponse: (response, handler) async {
        log('${response.data}', name: 'RESPONSE');

        return handler.resolve(response);
      },
    );
  }
}
