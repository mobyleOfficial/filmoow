import 'package:domain/model/lists_listing.dart';

abstract class ListsRepository {
  Future<ListsListing> getRecentLists(int page);
  Future<ListsListing> getPopularLists(int page);
  Future<ListsListing> getTrendingWeekList(int page);
  Future<void> createList();
}