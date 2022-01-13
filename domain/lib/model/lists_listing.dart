import 'package:domain/model/content_list.dart';

class ListsListing {
  const ListsListing({
    required this.hasNext,
    required this.lists,
  });

  final bool hasNext;
  final List<ContentList> lists;
}
