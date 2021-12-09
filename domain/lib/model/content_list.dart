import 'package:domain/model/content_list_stats.dart';

class ContentList {
  const ContentList({
    required this.id,
    required this.name,
    required this.stats,
    required this.imagesList,
    this.description,
    this.owner,
  });

  final String id;
  final String name;
  final String? description;
  final String? owner;
  final ContentListStats stats;
  final List<String> imagesList;
}
