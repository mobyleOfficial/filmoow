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
        onQuery
            .debounce(
              (event) => TimerStream(
                true,
                const Duration(seconds: 1),
              ),
            )
            .flatMap(_searchMovieList),
        onNexPageRequestSubject.stream.flatMap(_getMovieList),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetMovieListUseCase getMovieListUseCase;

  final BehaviorSubject<String> onQuery = BehaviorSubject<String>.seeded('');

  Stream<PaginationListingState<Movie, PaginationListingError>> _getMovieList(
      int offset) async* {
    if (onQuery.value.isEmpty) {
      final lastListingState = onNextStateSubject.value;

      try {
        if (lastListingState.list != null) {
          page++;
        }

        final listsListing = await getMovieListUseCase(
          GetMovieListUseCaseParams(
            page: page,
          ),
        );

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

  Stream<PaginationListingState<Movie, PaginationListingError>>
      _searchMovieList(String query) async* {
    yield const PaginationListingState<Movie, PaginationListingError>();

    try {
      page = 1;
      final listsListing = await getMovieListUseCase(
        GetMovieListUseCaseParams(
          page: page,
          query: query,
        ),
      );

      yield PaginationListingState<Movie, PaginationListingError>(
        list: listsListing.list,
      );
    } catch (error) {
      yield PaginationListingState<Movie, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: 0,
        list: [],
      );
    }
  }

  void onSearch(String query) => onQuery.add(query);

  @override
  void dispose() {
    onQuery.close();
    super.dispose();
  }
}
