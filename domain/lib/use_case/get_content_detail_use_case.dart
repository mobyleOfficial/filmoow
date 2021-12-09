import 'package:domain/model/content_detail.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetContentDetailUseCase
    extends ParametrizedUseCaseImpl<String, ContentDetail> {
  GetContentDetailUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<ContentDetail> getRawFuture({String? params}) =>
      repository.getContentDetail(params ?? '');
}
