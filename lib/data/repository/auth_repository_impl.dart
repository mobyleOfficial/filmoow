import 'package:domain/repository/auth_repository.dart';
import 'package:filmoow/data/local/secure/auth/auth_secure_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.secureDataSource,
  });

  final AuthSecureDataSource secureDataSource;

  @override
  Future<void> signIn(String token) =>
      secureDataSource.upsertAccessToken(token);
}
