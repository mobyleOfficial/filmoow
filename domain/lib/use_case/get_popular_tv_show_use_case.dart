import 'package:domain/model/tv_show.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetPopularTvShowUseCase extends UseCaseImpl<void, List<TvShow>> {
  GetPopularTvShowUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<List<TvShow>> getRawFuture({void params}) =>
      repository.getPopularTvShow();
}
