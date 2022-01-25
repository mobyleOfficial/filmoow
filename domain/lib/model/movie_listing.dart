import 'package:domain/model/movie.dart';

class MovieListing {
  const MovieListing({
    required this.list,
    required this.hasNext,
  });

  final List<Movie> list;
  final bool hasNext;
}
