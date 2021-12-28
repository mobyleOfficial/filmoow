import 'package:domain/model/user_information.dart';

abstract class UserRepository {
  Future<UserInformation> getUserInformation();
}