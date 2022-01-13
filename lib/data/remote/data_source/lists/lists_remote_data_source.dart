import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/lists_listing_remote_model.dart';

abstract class ListsRemoteDataSource {
  Future<ListsListingRemoteModel> getAllLists(int page);
  Future<ListsListingRemoteModel> getPopularLists(int page);
  Future<List<ContentListRemoteModel>> getTrendingWeekList();
  Future<void> createList();
}