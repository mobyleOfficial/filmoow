import 'package:domain/exceptions.dart';
import 'package:domain/model/comment_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetContentCommentsUseCase extends ParametrizedUseCaseImpl<
    GetContentCommentsUseCaseParams, CommentListing> {
  GetContentCommentsUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<CommentListing> getRawFuture(
      {GetContentCommentsUseCaseParams? params}) {
    if (params != null) {
      return repository.getCommentList(
        params.page,
        params.id,
      );
    }

    throw UseCaseParamsNeededException();
  }
}

class GetContentCommentsUseCaseParams {
  const GetContentCommentsUseCaseParams({
    required this.page,
    required this.id,
  });

  final int page;
  final String id;
}
