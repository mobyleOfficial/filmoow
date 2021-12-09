import 'package:domain/model/news_stats.dart';

class News {
  const News({
    required this.id,
    required this.title,
    required this.creation,
    required this.coverImage,
    required this.stats,
  });

  final String id;
  final String title;
  final String creation;
  final String coverImage;
  final NewsStats stats;
}
