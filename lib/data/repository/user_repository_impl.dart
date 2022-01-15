import 'package:domain/exceptions.dart';
import 'package:domain/model/user_information.dart';
import 'package:domain/model/user_listing.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:filmoow/data/local/secure/auth/auth_secure_data_source.dart';
import 'package:filmoow/data/remote/data_source/user/user_remote_data_source.dart';
import 'package:filmoow/data/remote/mappers/remote_to_domain_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({
    required this.secureDataSource,
    required this.userRemoteDataSource,
  });

  final AuthSecureDataSource secureDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  @override
  Future<UserInformation> getUserProfile() async {
    final token = await secureDataSource.getAccessToken();

    if (token != null) {
      if (token.isNotEmpty) {
        final userInfoRM = await userRemoteDataSource.getUserInformation();

        return userInfoRM.toDomain();
      }
    }

    throw UnauthorizedException();
  }

  @override
  Future<UserListing> getUsersList(int page) async {
    final remoteList = await userRemoteDataSource.getUsersList(page);

    return remoteList.toDomain();
  }
}
