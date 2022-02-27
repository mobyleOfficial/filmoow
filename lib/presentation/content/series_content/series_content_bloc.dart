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
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetSeriesListUseCase getSeriesListUseCase;

  Stream<PaginationListingState<Series, PaginationListingError>>
  _getSeriesList(int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getSeriesListUseCase(page);

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
}