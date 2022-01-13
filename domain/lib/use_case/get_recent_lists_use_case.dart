import 'package:domain/model/lists_listing.dart';
import 'package:domain/repository/lists_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetRecentListsUseCase extends ParametrizedUseCaseImpl<int, ListsListing> {
  GetRecentListsUseCase({
    required this.repository,
  });

  final ListsRepository repository;

  @override
  Future<ListsListing> getRawFuture({int? params}) => repository.getRecentLists(
        params ?? 1,
      );
}
