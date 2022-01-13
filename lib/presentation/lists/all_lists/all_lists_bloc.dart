import 'package:domain/use_case/get_all_lists_use_case.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:filmoow/presentation/lists/all_lists/state/all_lists_state.dart';
import 'package:rxdart/rxdart.dart';

class AllListsBloc with SubscriptionHolder {
  AllListsBloc({
    required this.getAllListsUseCase,
  }) {
    MergeStream([
      _getAllLists(),
    ]).listen(_onNewState.add);
  }

  final GetAllListsUseCase getAllListsUseCase;

  final BehaviorSubject<AllListsState> _onNewState =
      BehaviorSubject.seeded(Loading());

  Stream<AllListsState> get onNewState => _onNewState;

  Stream<AllListsState> _getAllLists() async* {
    yield Loading();

    try {
      final listsListing = await getAllListsUseCase(1);

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
