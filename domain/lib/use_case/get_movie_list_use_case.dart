import 'package:domain/model/movie_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetMovieListUseCase
    extends ParametrizedUseCaseImpl<GetMovieListUseCaseParams, MovieListing> {
  GetMovieListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<MovieListing> getRawFuture({GetMovieListUseCaseParams? params}) =>
      repository.getMovieList(
        params?.page ?? 1,
        query: params?.query,
      );
}

class GetMovieListUseCaseParams {
  const GetMovieListUseCaseParams({
    required this.page,
    this.query,
  });

  final int page;
  final String? query;
}
