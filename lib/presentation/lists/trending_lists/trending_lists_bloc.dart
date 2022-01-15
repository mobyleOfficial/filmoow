import 'package:domain/model/content_list.dart';
import 'package:domain/use_case/get_treding_lists_use_case.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class TrendingListsBloc
    extends PaginationBloc<ContentList, PaginationListingError> {
  TrendingListsBloc({
    required this.getTrendingListsUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getRecentLists),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetTrendingListsUseCase getTrendingListsUseCase;

  Stream<PaginationListingState<ContentList, PaginationListingError>>
  _getRecentLists(int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getTrendingListsUseCase(page);

      yield PaginationListingState<ContentList, PaginationListingError>(
        nextOffset: listsListing.hasNext ? page : null,
        list: [
          ...lastListingState.list ?? [],
          ...listsListing.lists,
        ],
      );
    } catch (error) {
      yield PaginationListingState<ContentList, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
      );
    }
  }
}
