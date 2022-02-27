import 'package:domain/model/movie.dart';
import 'package:domain/model/series.dart';

class SeriesListing {
  const SeriesListing({
    required this.list,
    required this.hasNext,
  });

  final List<Series> list;
  final bool hasNext;
}
