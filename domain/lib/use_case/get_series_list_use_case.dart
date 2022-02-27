import 'package:domain/model/movie_listing.dart';
import 'package:domain/model/series_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetSeriesListUseCase extends ParametrizedUseCaseImpl<int, SeriesListing> {
  GetSeriesListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<SeriesListing> getRawFuture({int? params}) => repository.getSeriesList(
        params ?? 1,
      );
}
