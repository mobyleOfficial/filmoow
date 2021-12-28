import 'package:domain/model/user_information.dart';

abstract class ProfileState {}

class Loading extends ProfileState {}

class Success extends ProfileState {
  Success({
    required this.userInformation,
  });

  final UserInformation userInformation;
}

abstract class Error extends ProfileState {}

class Unauthorized extends Error {}

class GenericError extends Error {}
