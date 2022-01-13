import 'package:domain/model/content_list.dart';
import 'package:domain/repository/lists_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetTrendingListUseCase extends UseCaseImpl<void, List<ContentList>> {
  GetTrendingListUseCase({
    required this.repository,
  });

  final ListsRepository repository;

  @override
  Future<List<ContentList>> getRawFuture({void params}) =>
      repository.getTrendingWeekList();
}
