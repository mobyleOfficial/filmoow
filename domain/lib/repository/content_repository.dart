import 'package:domain/model/comment_listing.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/movie_listing.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/model/series_listing.dart';
import 'package:domain/model/tv_show_listing.dart';

abstract class ContentRepository {
  Future<ContentDetail> getContentDetail(String id);

  Future<SeenStatus> changeSeenStatus(String id, SeenStatus seenStatus);

  Future<CommentListing> getCommentList(int page, String id);

  Future<void> addComment(String id, String comment);

  Future<MovieListing> getMovieList(int page, {String? query});

  Future<SeriesListing> getSeriesList(int page, {String? query});

  Future<TvShowListing> getTvShowList(int page, {String? query});
}