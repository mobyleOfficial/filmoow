import 'package:domain/model/tv_show.dart';

class TvShowListing {
  const TvShowListing({
    required this.list,
    required this.hasNext,
  });

  final List<TvShow> list;
  final bool hasNext;
}