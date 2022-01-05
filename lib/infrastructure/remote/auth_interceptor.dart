import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
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
        } catch (error) {
          //do nothing
        }

        handler.next(options);
      },
    onError: (error, handler) {
        if(error is DioError) {
          if(error.error == 'Http status error [401]') {
            //todo: Call data observable to update all blocs
            //handler.next();
          }
        }
        handler.next(error);
    }
  );

  final AuthSecureDataSource authSecureDataSource;
}