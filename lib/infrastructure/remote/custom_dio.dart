import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:domain/exceptions.dart';

class CustomDio extends DioForNative {
  CustomDio(BaseOptions options) : super(options);

  @override
  Future<Response<T>> request<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      return await super.request(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
    } catch (error) {
      if (error is DioError) {
        if (error.error == 'Http status error [401]') {
          throw UnauthorizedException();
        } else if (error.error is SocketException) {
          throw NoConnectionException();
        }
        rethrow;
      } else {
        rethrow;
      }
    }
  }
}
