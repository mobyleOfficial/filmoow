import 'package:domain/model/series_listing.dart';
import 'package:domain/model/tv_show_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetTvShowListUseCase extends ParametrizedUseCaseImpl<int, TvShowListing> {
  GetTvShowListUseCase({
    required this.repository,
  });

  final ContentRepository repository;

  @override
  Future<TvShowListing> getRawFuture({int? params}) => repository.getTvShowList(
        params ?? 1,
      );
}
