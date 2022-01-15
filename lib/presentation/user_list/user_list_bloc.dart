import 'package:domain/model/user.dart';
import 'package:domain/use_case/get_users_lists_use_case.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc extends PaginationBloc<User, PaginationListingError> {
  UserListBloc({
    required this.getUserListsUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getUserList),
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);
  }

  final GetUserListsUseCase getUserListsUseCase;

  Stream<PaginationListingState<User, PaginationListingError>> _getUserList(
      int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        page++;
      }

      final listsListing = await getUserListsUseCase(page);

      yield PaginationListingState<User, PaginationListingError>(
        nextOffset: listsListing.hasNext ? page : null,
        list: [
          ...lastListingState.list ?? [],
          ...listsListing.userList,
        ],
      );
    } catch (error) {
      yield PaginationListingState<User, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
      );
    }
  }
}
