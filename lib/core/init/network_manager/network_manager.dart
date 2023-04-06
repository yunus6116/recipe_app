import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../env.dart';

class NetworkManager {
  final Ref ref;
  late Dio _dio;
  NetworkManager(this.ref) {
    ref.read;
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.baseUrl,
        followRedirects: false,
      ),
    );
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler) async {
          if (DioErrorType.receiveTimeout == error.type ||
              DioErrorType.connectTimeout == error.type) {
            debugPrint('Request Timed Out');
            handler.reject(DioError(
                requestOptions: error.requestOptions,
                error: 'Request Timed Out'));
          } else if (DioErrorType.other == error.type) {
            if (error.message.contains('SocketException')) {
              debugPrint('Cant Reach Server');
              handler.reject(DioError(
                  requestOptions: error.requestOptions,
                  error: 'Cant Reach Server'));
            } else if (error.message.contains('HandshakeException')) {
              debugPrint('Cant Reach Server');
              handler.reject(DioError(
                  requestOptions: error.requestOptions,
                  error: 'Cant Reach Server'));
            }
          } else if (DioErrorType.response == error.type) {
            if (error.response!.statusCode! >= 500) {
              debugPrint('Server Error');
              handler.reject(DioError(
                  requestOptions: error.requestOptions, error: 'Server Error'));
            }
          }
          handler.next(error);
        },
      ), // Open File
    );
  }

  _headers() {
    var headerBody = {
      'content-type': 'application/json',
      'Accept': 'application/json',
    };
    return headerBody;
  }

  Future<Response> get(
    String apiUrl, {
    ResponseType responseType = ResponseType.json,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _dio.get(
      apiUrl,
      queryParameters: queryParameters,
      options: Options(
        responseType: responseType,
        headers: _headers(),
      ),
    );
  }
}

final networkManagerProvider = Provider((ref) => NetworkManager(ref));
