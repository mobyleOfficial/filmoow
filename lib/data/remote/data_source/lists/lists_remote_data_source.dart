import 'package:filmoow/data/remote/model/lists_listing_remote_model.dart';

abstract class ListsRemoteDataSource {
  Future<ListsListingRemoteModel> getRecentLists(int page);
  Future<ListsListingRemoteModel> getPopularLists(int page);
  Future<ListsListingRemoteModel> getTrendingWeekList(int page);
  Future<void> createList();
}