import 'package:domain/model/content_list.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetPopularHomeListUseCase extends UseCaseImpl<void, List<ContentList>> {
  GetPopularHomeListUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<List<ContentList>> getRawFuture({void params}) =>
      repository.getPopularList();
}
