import 'package:domain/model/movie_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetMovieListUseCase extends ParametrizedUseCaseImpl<int, MovieListing> {
  GetMovieListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<MovieListing> getRawFuture({int? params}) => repository.getMovieList(
        params ?? 1,
      );
}
