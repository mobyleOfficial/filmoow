import 'package:dio/dio.dart';
import 'package:filmoow/data/remote/data_source/content/content_remote_data_source.dart';
import 'package:filmoow/data/remote/model/comment_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/series_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_listing_remote_model.dart';

class ContentRemoteDataSourceImpl implements ContentRemoteDataSource {
  const ContentRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<ContentDetailRemoteModel> getContentDetail(String id) async {
    final response = await dio.get('/content/$id');

    return ContentDetailRemoteModel.fromJson(response.data);
  }

  @override
  Future<String> changeSeenStatus(String id, String status) async {
    final response = await dio.post(
      '/content',
      data: {
        'id': id,
        'status': status,
      },
    );

    return Future.value(response.data);
  }

  @override
  Future<CommentListingRemoteModel> getCommentList(int page, String id) async {
    final response = await dio.get('/content/comments/$id?page=$page');

    return CommentListingRemoteModel.fromJson(response.data);
  }

  @override
  Future<void> addComment(String id, String comment) => dio.post(
        '/content/comments/$id',
        data: {
          'message': comment,
        },
      );

  @override
  Future<MovieListingRemoteModel> getMovieList(int page) async {
    final response = await dio.get('/content/movieList?page=$page');

    return MovieListingRemoteModel.fromJson(response.data);
  }

  @override
  Future<SeriesListingRemoteModel> getSeriesList(int page) async{
    final response = await dio.get('/content/seriesList?page=$page');

    return SeriesListingRemoteModel.fromJson(response.data);
  }

  @override
  Future<TvShowListingRemoteModel> getTvShowList(int page) async {
    final response = await dio.get('/content/tvShowList?page=$page');

    return TvShowListingRemoteModel.fromJson(response.data);
  }
}
