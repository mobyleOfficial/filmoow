import 'package:domain/model/series.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetPopularSeriesUseCase extends UseCaseImpl<void, List<Series>> {
  GetPopularSeriesUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<List<Series>> getRawFuture({void params}) =>
      repository.getPopularSeries();
}
