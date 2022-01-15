import 'package:domain/model/user_information.dart';
import 'package:domain/model/user_listing.dart';

abstract class UserRepository {
  Future<UserInformation> getUserProfile();
  Future<UserListing> getUsersList(int page);
}