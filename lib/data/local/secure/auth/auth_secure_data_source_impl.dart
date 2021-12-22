import 'package:filmoow/data/local/secure/auth/auth_secure_data_source.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSecureDataSourceImpl implements AuthSecureDataSource {
  const AuthSecureDataSourceImpl(
    this.secureStorage,
  );

  final FlutterSecureStorage secureStorage;
  static const _accessTokenKey = 'accessToken';

  @override
  Future<void> upsertAccessToken(String accessToken) => secureStorage.write(
        key: _accessTokenKey,
        value: accessToken,
      );

  @override
  Future<String?> getAccessToken() => secureStorage.read(
        key: _accessTokenKey,
      );

  @override
  Future<void> deleteAccessToken() => secureStorage.delete(
        key: _accessTokenKey,
      );
}
