import 'package:domain/model/comment_listing.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/movie_listing.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/model/series_listing.dart';
import 'package:domain/model/tv_show_listing.dart';
import 'package:domain/repository/content_repository.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/mappers/domain_to_remote_mapper.dart';
import 'package:filmoow/data/remote/mappers/remote_to_domain_mapper.dart';

class ContentRepositoryImpl implements ContentRepository {
  const ContentRepositoryImpl({
    required this.dataSource,
  });

  final ContentRemoteDataSource dataSource;

  @override
  Future<ContentDetail> getContentDetail(String id) async {
    final contentRemoteModel = await dataSource.getContentDetail(id);

    return contentRemoteModel.toDomain();
  }

  @override
  Future<SeenStatus> changeSeenStatus(String id, SeenStatus seenStatus) async {
    final response =
        await dataSource.changeSeenStatus(id, seenStatus.toRemoteModel());

    return Future.value(response.toSeenStatusDomain());
  }

  @override
  Future<CommentListing> getCommentList(int page, String id) async {
    final commentListingRM = await dataSource.getCommentList(page, id);

    return Future.value(commentListingRM.toDomain());
  }

  @override
  Future<void> addComment(String id, String comment) =>
      dataSource.addComment(id, comment);

  @override
  Future<MovieListing> getMovieList(int page) async {
    final movieListingRM = await dataSource.getMovieList(page);

    return Future.value(movieListingRM.toDomain());
  }

  @override
  Future<SeriesListing> getSeriesList(int page) async {
    final seriesListingRM = await dataSource.getSeriesList(page);

    return Future.value(seriesListingRM.toDomain());
  }

  @override
  Future<TvShowListing> getTvShowList(int page) async{
    final tvShowListing = await dataSource.getTvShowList(page);

    return Future.value(tvShowListing.toDomain());
  }
}
