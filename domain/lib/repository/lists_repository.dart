import 'package:domain/model/content_list.dart';
import 'package:domain/model/lists_listing.dart';

abstract class ListsRepository {
  Future<ListsListing> getRecentLists(int page);
  Future<ListsListing> getPopularLists(int page);
  Future<List<ContentList>> getTrendingWeekList();
  Future<void> createList();
}