import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/news_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_remote_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<MovieRemoteModel>> getPopularMovie();

  Future<List<MovieRemoteModel>> getMoviesComingSoon();

  Future<List<MovieRemoteModel>> getMoviesWeekPremiere();

  Future<List<MovieRemoteModel>> getAvailableMovies();

  Future<List<SeriesRemoteModel>> getPopularSeries();

  Future<List<TvShowRemoteModel>> getPopularTvShow();

  Future<List<ContentListRemoteModel>> getPopularList();

  Future<List<NewsRemoteModel>> getLatestNews();
}