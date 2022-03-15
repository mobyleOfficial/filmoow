import 'package:domain/model/movie.dart';
import 'package:domain/model/series.dart';
import 'package:domain/use_case/get_movie_list_use_case.dart';
import 'package:domain/use_case/get_series_list_use_case.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class SeriesContentBloc extends PaginationBloc<Series, PaginationListingError> {
  SeriesContentBloc({
    required this.getSeriesListUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getSeriesList),
        onQuery
            .debounce(
              (event) => TimerStream(
                true,
                const Duration(seconds: 1),
              ),
            )
            .flatMap(_searchSeriesList),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetSeriesListUseCase getSeriesListUseCase;

  final BehaviorSubject<String> onQuery = BehaviorSubject<String>.seeded('');

  Stream<PaginationListingState<Series, PaginationListingError>> _getSeriesList(
      int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getSeriesListUseCase(
        GetSeriesListUseCaseParams(
          page: page,
        ),
      );

      yield PaginationListingState<Series, PaginationListingError>(
        nextOffset: listsListing.hasNext ? page : null,
        list: [
          ...lastListingState.list ?? [],
          ...listsListing.list,
        ],
      );
    } catch (error) {
      yield PaginationListingState<Series, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
      );
    }
  }

  Stream<PaginationListingState<Series, PaginationListingError>>
      _searchSeriesList(String query) async* {
    yield const PaginationListingState<Series, PaginationListingError>();

    try {
      page = 1;
      final listsListing = await getSeriesListUseCase(
        GetSeriesListUseCaseParams(
          page: page,
          query: query,
        ),
      );

      yield PaginationListingState<Series, PaginationListingError>(
        list: listsListing.list,
      );
    } catch (error) {
      yield PaginationListingState<Series, PaginationListingError>(
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
