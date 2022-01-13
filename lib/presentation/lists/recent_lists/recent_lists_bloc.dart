import 'package:domain/use_case/get_recent_lists_use_case.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:filmoow/presentation/lists/recent_lists/state/recent_lists_state.dart';
import 'package:rxdart/rxdart.dart';

class RecentListsBloc with SubscriptionHolder {
  RecentListsBloc({
    required this.getRecentListsUseCase,
  }) {
    MergeStream([
      _getRecentLists(),
    ]).listen(_onNewState.add);
  }

  final GetRecentListsUseCase getRecentListsUseCase;

  final BehaviorSubject<RecentListsState> _onNewState =
      BehaviorSubject.seeded(Loading());

  Stream<RecentListsState> get onNewState => _onNewState;

  Stream<RecentListsState> _getRecentLists() async* {
    yield Loading();

    try {
      final listsListing = await getRecentListsUseCase(1);

      yield Success(
        lists: listsListing.lists,
      );
    } catch (error) {
      yield Error();
    }
  }

  void dispose() {
    _onNewState.close();
  }
}
