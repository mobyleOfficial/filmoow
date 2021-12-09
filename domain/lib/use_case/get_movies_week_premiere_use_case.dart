import 'package:domain/model/movie.dart';
import 'package:domain/repository/home_repository.dart';
import 'package:domain/use_case/use_case.dart';

class GetMoviesWeekPremiereUseCase extends UseCaseImpl<void, List<Movie>> {
  GetMoviesWeekPremiereUseCase({
    required this.repository,
  });

  final HomeRepository repository;

  @override
  Future<List<Movie>> getRawFuture({void params}) =>
      repository.getMoviesWeekPremiere();
}
