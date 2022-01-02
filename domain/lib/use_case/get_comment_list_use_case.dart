import 'package:domain/exceptions.dart';
import 'package:domain/model/comment_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetCommentListUseCase extends ParametrizedUseCaseImpl<
    GetCommentListUseCaseParams, CommentListing> {
  GetCommentListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<CommentListing> getRawFuture(
      {GetCommentListUseCaseParams? params}) {
    if (params != null) {
      return repository.getCommentList(
        params.page,
        params.id,
      );
    }

    throw UseCaseParamsNeededException();
  }
}

class GetCommentListUseCaseParams {
  const GetCommentListUseCaseParams({
    required this.page,
    required this.id,
  });

  final int page;
  final String id;
}
