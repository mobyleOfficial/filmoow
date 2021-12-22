import 'package:dio/dio.dart';
import 'package:filmoow/data/local/secure/auth/auth_secure_data_source.dart';

class AuthInterceptor extends InterceptorsWrapper {
  AuthInterceptor(
      this.authSecureDataSource,
      ) : super(
      onRequest: (options, handler) async {
        try {
          final accessToken = await authSecureDataSource.getAccessToken();

          if (accessToken != null) {
            options.headers.addAll(
              {'Authorization': accessToken},
            );
          }
        } catch (_) {
          //do nothing
        }

        handler.next(options);
      }
  );

  final AuthSecureDataSource authSecureDataSource;
}