import 'package:filmoow/data/remote/model/user_information_remote_model.dart';

abstract class UserRemoteDataSource {
  Future<UserInformationRemoteModel> getUserInformation();
}