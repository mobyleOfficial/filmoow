import 'package:domain/model/user_information.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetUserInformationUseCase extends UseCaseImpl<void, UserInformation> {
  GetUserInformationUseCase({
    required this.repository,
  });

  final UserRepository repository;

  @override
  Future<UserInformation> getRawFuture({void params}) =>
      repository.getUserInformation();
}
