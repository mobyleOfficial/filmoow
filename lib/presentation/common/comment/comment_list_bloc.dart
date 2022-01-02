import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:rxdart/rxdart.dart';

class CommentListBloc with SubscriptionHolder {
  CommentListBloc({
    required this.id,
    required this.getCommentListUseCase,
  }) {
    _onNextCommentListPageRequestSubject.stream
        .flatMap(_getCommentList)
        .listen(_onNextCommentListStateSubject.add)
        .addTo(subscriptions);
  }

  final String id;
  final GetCommentListUseCase getCommentListUseCase;
  final _onNextCommentListStateSubject =
      BehaviorSubject<CommentListingState>.seeded(
    const CommentListingState(),
  );
  final _onNextCommentListPageRequestSubject = PublishSubject<int>();

  int _page = 1;

  Stream<CommentListingState> get onNextCommentListState =>
      _onNextCommentListStateSubject.stream;

  Stream<CommentListingState> _getCommentList(int offset) async* {
    final lastListingState = _onNextCommentListStateSubject.value;

    try {
      if (lastListingState.commentList != null) {
        _page++;
      }

      final commentListing = await getCommentListUseCase(
        GetCommentListUseCaseParams(
          page: _page,
          id: id,
        ),
      );

      yield CommentListingState(
        nextOffset: commentListing.hasNext ? _page : null,
        commentList: [
          ...lastListingState.commentList ?? [],
          ...commentListing.commentList
        ],
      );
    } catch (error) {
      yield CommentListingState(
        error: CommentListingError(),
        nextOffset: lastListingState.nextOffset,
        commentList: lastListingState.commentList,
      );
    }
  }

  void requestNextPage(int offset) {
    _onNextCommentListPageRequestSubject.add(offset);
  }

  void dispose() {
    _onNextCommentListPageRequestSubject.close();
    _onNextCommentListStateSubject.close();
  }
}
