import 'package:domain/model/news.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetLatestUseCase extends UseCaseImpl<void, List<News>> {
  GetLatestUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<List<News>> getRawFuture({
    void params,
  }) =>
      repository.getLatestNews();
}
