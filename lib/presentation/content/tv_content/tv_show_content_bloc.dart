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
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetTvShowListUseCase getTvShowListUseCase;

  Stream<PaginationListingState<TvShow, PaginationListingError>> _getTvShowList(
      int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getTvShowListUseCase(page);

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
}
