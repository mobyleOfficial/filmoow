import 'package:dio/dio.dart';
import 'package:domain/exceptions.dart';
import 'package:filmoow/data/remote/data_source/user/user_remote_data_source.dart';
import 'package:filmoow/data/remote/model/user_information_remote_model.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<UserInformationRemoteModel> getUserInformation() async {
    final response = await dio.get('/profile');

    return UserInformationRemoteModel.fromJson(response.data);
  }
}