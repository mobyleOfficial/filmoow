import 'package:filmoow/data/remote/model/user_information_remote_model.dart';
import 'package:filmoow/data/remote/model/user_listing_remote_model.dart';

abstract class UserRemoteDataSource {
  Future<UserInformationRemoteModel> getUserInformation();
  Future<UserListingRemoteModel> getUsersList(int page);
}