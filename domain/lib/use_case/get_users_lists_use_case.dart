import 'package:domain/model/user_listing.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetUserListsUseCase extends ParametrizedUseCaseImpl<int, UserListing> {
  GetUserListsUseCase({
    required this.repository,
  });

  final UserRepository repository;

  @override
  Future<UserListing> getRawFuture({int? params}) => repository.getUsersList(
        params ?? 1,
      );
}
