import 'package:domain/model/content_list.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';

abstract class HomeRepository {
  Future<List<Movie>> getPopularMovie();

  Future<List<Movie>> getAvailableMovies();

  Future<List<Movie>> getMoviesComingSoon();

  Future<List<Movie>> getMoviesWeekPremiere();

  Future<List<Series>> getPopularSeries();

  Future<List<TvShow>> getPopularTvShow();

  Future<List<ContentList>> getPopularList();

  Future<List<News>> getLatestNews();
}
