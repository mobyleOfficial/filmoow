import 'package:domain/model/lists_listing.dart';
import 'package:domain/repository/lists_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetAllListsUseCase extends ParametrizedUseCaseImpl<int, ListsListing> {
  GetAllListsUseCase({
    required this.repository,
  });

  final ListsRepository repository;

  @override
  Future<ListsListing> getRawFuture({int? params}) => repository.getAllLists(
        params ?? 1,
      );
}
