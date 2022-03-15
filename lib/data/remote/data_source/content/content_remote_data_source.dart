import 'package:filmoow/data/remote/model/comment_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/series_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_listing_remote_model.dart';

abstract class ContentRemoteDataSource {
  Future<ContentDetailRemoteModel> getContentDetail(String id);

  Future<String> changeSeenStatus(
    String id,
    String status,
  );

  Future<CommentListingRemoteModel> getCommentList(int page, String id);

  Future<void> addComment(String id, String comment);

  Future<MovieListingRemoteModel> getMovieList(int page, String? query);

  Future<SeriesListingRemoteModel> getSeriesList(int page, String? query);

  Future<TvShowListingRemoteModel> getTvShowList(int page, String? query);
}
