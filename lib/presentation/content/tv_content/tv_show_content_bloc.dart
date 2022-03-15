import 'package:domain/model/movie.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:domain/use_case/get_movie_list_use_case.dart';
import 'package:domain/use_case/get_series_list_use_case.dart';
import 'package:domain/use_case/get_tv_show_list_use_case.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class TvShowsContentBloc
    extends PaginationBloc<TvShow, PaginationListingError> {
  TvShowsContentBloc({
    required this.getTvShowListUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getTvShowList),
        onQuery
            .debounce(
              (event) => TimerStream(
                true,
                const Duration(seconds: 1),
              ),
            )
            .flatMap(_searchTvShowList),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetTvShowListUseCase getTvShowListUseCase;

  final BehaviorSubject<String> onQuery = BehaviorSubject<String>.seeded('');

  Stream<PaginationListingState<TvShow, PaginationListingError>> _getTvShowList(
      int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getTvShowListUseCase(
        GetTvShowListUseCaseParams(
          page: page,
        ),
      );

      yield PaginationListingState<TvShow, PaginationListingError>(
        nextOffset: listsListing.hasNext ? page : null,
        list: [
          ...lastListingState.list ?? [],
          ...listsListing.list,
        ],
      );
    } catch (error) {
      yield PaginationListingState<TvShow, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
      );
    }
  }

  Stream<PaginationListingState<TvShow, PaginationListingError>>
      _searchTvShowList(String query) async* {
    yield const PaginationListingState<TvShow, PaginationListingError>();

    try {
      page = 1;
      final listsListing = await getTvShowListUseCase(
        GetTvShowListUseCaseParams(
          page: page,
          query: query,
        ),
      );

      yield PaginationListingState<TvShow, PaginationListingError>(
        list: listsListing.list,
      );
    } catch (error) {
      yield PaginationListingState<TvShow, PaginationListingError>(
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
