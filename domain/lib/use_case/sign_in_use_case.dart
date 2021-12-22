import 'package:domain/repository/auth_repository.dart';
import 'package:domain/use_case/use_case.dart';

class SignInUseCase extends ParametrizedUseCaseImpl<String, void> {
  SignInUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<void> getRawFuture({String? params}) =>
      repository.signIn(params ?? '');
}
