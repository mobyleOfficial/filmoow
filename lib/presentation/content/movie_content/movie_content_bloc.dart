import 'package:domain/model/movie.dart';
import 'package:domain/use_case/get_movie_list_use_case.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class MovieContentBloc extends PaginationBloc<Movie, PaginationListingError> {
  MovieContentBloc({
    required this.getMovieListUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getMovieList),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetMovieListUseCase getMovieListUseCase;

  Stream<PaginationListingState<Movie, PaginationListingError>>
  _getMovieList(int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getMovieListUseCase(page);

      yield PaginationListingState<Movie, PaginationListingError>(
        nextOffset: listsListing.hasNext ? page : null,
        list: [
          ...lastListingState.list ?? [],
          ...listsListing.list,
        ],
      );
    } catch (error) {
      yield PaginationListingState<Movie, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
      );
    }
  }
}