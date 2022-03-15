import 'package:domain/model/series_listing.dart';
import 'package:domain/model/tv_show_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetTvShowListUseCase
    extends ParametrizedUseCaseImpl<GetTvShowListUseCaseParams, TvShowListing> {
  GetTvShowListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<TvShowListing> getRawFuture({GetTvShowListUseCaseParams? params}) =>
      repository.getTvShowList(
        params?.page ?? 1,
        query: params?.query,
      );
}

class GetTvShowListUseCaseParams {
  const GetTvShowListUseCaseParams({
    required this.page,
    this.query,
  });

  final int page;
  final String? query;
}
