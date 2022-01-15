import 'package:dio/dio.dart';
import 'package:filmoow/data/remote/data_source/lists/lists_remote_data_source.dart';
import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/lists_listing_remote_model.dart';

class ListsRemoteDataSourceImpl implements ListsRemoteDataSource {
  const ListsRemoteDataSourceImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<void> createList() {
    // TODO: implement createList
    throw UnimplementedError();
  }

  @override
  Future<ListsListingRemoteModel> getRecentLists(int page) async {
    final response = await dio.get('/lists/recent?page=$page');

    return ListsListingRemoteModel.fromJson(response.data);
  }

  @override
  Future<ListsListingRemoteModel> getPopularLists(int page) async {
    final response = await dio.get('/lists/popular?page=$page');

    return ListsListingRemoteModel.fromJson(response.data);
  }

  @override
  Future<ListsListingRemoteModel> getTrendingWeekList(int page) async {
    final response = await dio.get('/lists/trending?page=$page');

    return ListsListingRemoteModel.fromJson(response.data);
  }
}
