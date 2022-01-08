import 'package:domain/exceptions.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class AddCommentUseCase
    extends ParametrizedUseCaseImpl<AddCommentUseCaseParams, void> {
  AddCommentUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<void> getRawFuture({AddCommentUseCaseParams? params}) {
    if (params != null) {
      return repository.addComment(
        params.id,
        params.comment,
      );
    }

    throw UseCaseParamsNeededException();
  }
}

class AddCommentUseCaseParams {
  const AddCommentUseCaseParams({
    required this.id,
    required this.comment,
  });

  final String id;
  final String comment;
}

