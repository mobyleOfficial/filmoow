import 'package:domain/model/seen_status.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class ChangeSeenStatusUseCase
    extends ParametrizedUseCaseImpl<ChangeSeenStatusUseCaseParams, SeenStatus> {
  ChangeSeenStatusUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<SeenStatus> getRawFuture({ChangeSeenStatusUseCaseParams? params}) {
    if (params != null) {
      return repository.changeSeenStatus(
        params.id,
        params.status,
      );
    }

    return Future.value(SeenStatus.none);
  }
}

class ChangeSeenStatusUseCaseParams {
  const ChangeSeenStatusUseCaseParams({
    required this.id,
    required this.status,
  });

  final String id;
  final SeenStatus status;
}
