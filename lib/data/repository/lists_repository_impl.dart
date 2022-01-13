import 'package:domain/model/content_list.dart';
import 'package:domain/model/lists_listing.dart';
import 'package:domain/repository/lists_repository.dart';
import 'package:filmoow/data/remote/data_source/lists/lists_remote_data_source.dart';
import 'package:filmoow/data/remote/mappers/remote_to_domain_mapper.dart';

class ListsRepositoryImpl implements ListsRepository {
  const ListsRepositoryImpl({
    required this.remoteDataSource,
  });

  final ListsRemoteDataSource remoteDataSource;

  @override
  Future<void> createList() {
    // TODO: implement createList
    throw UnimplementedError();
  }

  @override
  Future<ListsListing> getAllLists(int page) async {
    final list = await remoteDataSource.getAllLists(page);

    return list.toDomain();
  }

  @override
  Future<ListsListing> getPopularLists(int page) async {
    final popularList = await remoteDataSource.getPopularLists(page);

    return popularList.toDomain();
  }

  @override
  Future<List<ContentList>> getTrendingWeekList() async {
    final trendingList = await remoteDataSource.getTrendingWeekList();

    return trendingList
        .map(
          (list) => list.toDomain(),
        )
        .toList();
  }
}
