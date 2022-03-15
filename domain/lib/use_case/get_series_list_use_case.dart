import 'package:domain/model/series_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetSeriesListUseCase
    extends ParametrizedUseCaseImpl<GetSeriesListUseCaseParams, SeriesListing> {
  GetSeriesListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<SeriesListing> getRawFuture({GetSeriesListUseCaseParams? params}) =>
      repository.getSeriesList(
        params?.page ?? 1,
        query: params?.query,
      );
}

class GetSeriesListUseCaseParams {
  const GetSeriesListUseCaseParams({
    required this.page,
    this.query,
  });

  final int page;
  final String? query;
}
