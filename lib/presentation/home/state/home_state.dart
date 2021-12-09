import 'package:domain/model/content_list.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';

abstract class HomeState {}

class Loading extends HomeState {}

class Success extends HomeState {
  Success({
    required this.popularMovieList,
    required this.popularTvShowList,
    required this.popularSeriesList,
    required this.contentListList,
    required this.latestNewsList,
    required this.weekPremiereMovieList,
    required this.comingSoonMovieList,
    required this.availableMovieList,
  });

  final List<Movie> popularMovieList;
  final List<TvShow> popularTvShowList;
  final List<Series> popularSeriesList;
  final List<ContentList> contentListList;
  final List<News> latestNewsList;
  final List<Movie> weekPremiereMovieList;
  final List<Movie> comingSoonMovieList;
  final List<Movie> availableMovieList;
}

class Error extends HomeState {}
