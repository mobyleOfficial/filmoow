import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:filmoow/presentation/common/comment/action/comment_list_actions.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:domain/use_case/add_comment_use_case.dart';
import 'package:rxdart/rxdart.dart';

class CommentListBloc with SubscriptionHolder {
  CommentListBloc({
    required this.id,
    required this.getCommentListUseCase,
    required this.addCommentUseCase,
  }) {
    MergeStream(
      [
        _onNextCommentListPageRequestSubject.stream.flatMap(_getCommentList),
        _onTryAgainSubject.flatMap(
          (_) => _getCommentList(0),
        )
      ],
    ).listen(_onNextCommentListStateSubject.add)
        .addTo(subscriptions);

    _onAddCommentSubject
        .flatMap(
          (_) => Future.wait(
            [],
            eagerError: false,
          ).asStream(),
        )
        .flatMap(
          (_) => _addComment(),
        )
        .listen((_) {})
        .addTo(subscriptions);
  }

  final String id;
  final GetCommentListUseCase getCommentListUseCase;
  final AddCommentUseCase addCommentUseCase;
  final _onNextCommentListStateSubject =
      BehaviorSubject<CommentListingState>.seeded(
    const CommentListingState(),
  );
  final _onNextCommentListPageRequestSubject = PublishSubject<int>();
  final statusStream = PublishSubject<TextInputStatus>();
  final _onAction = PublishSubject<CommentListActions>();

  int _page = 1;

  Stream<CommentListingState> get onNextCommentListState =>
      _onNextCommentListStateSubject.stream;

  Stream<CommentListActions> get onAction => _onAction.stream;

  // Comment
  final _onCommentValueChangedSubject = BehaviorSubject<String?>();
  final _commentInputStatusSubject = PublishSubject<TextInputStatus>();
  final _onCommentFocusLostSubject = PublishSubject<void>();

  String? get _commentValue => _onCommentValueChangedSubject.stream.valueOrNull;

  Sink<String?> get onCommentValueChangedSink =>
      _onCommentValueChangedSubject.sink;

  Sink<void> get onCommentFocusLostSink => _onCommentFocusLostSubject.sink;

  Stream<TextInputStatus> get commentInputStatusStream =>
      _commentInputStatusSubject.stream;

  // Add comment button action
  final _onAddCommentSubject = PublishSubject<void>();

  final _onTryAgainSubject = PublishSubject<void>();

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

  void onAddComment() => _onAddCommentSubject.sink.add(null);

  Stream<CommentListState> _addComment() async* {
    yield Loading();

    try {
      await addCommentUseCase(
        AddCommentUseCaseParams(
          id: id,
          comment: _commentValue ?? '',
        ),
      );

      _onNextCommentListStateSubject.add(
        const CommentListingState(),
      );

      _onAction.add(DismissCommentAction());

      _onTryAgainSubject.add(null);
    } catch (error) {
      //todo: do somethinng
      print(error);
    }
  }

  void requestNextPage(int offset) {
    _onNextCommentListPageRequestSubject.add(offset);
  }

  void dispose() {
    _onNextCommentListPageRequestSubject.close();
    _onNextCommentListStateSubject.close();
    statusStream.close();
    _onCommentValueChangedSubject.close();
    _commentInputStatusSubject.close();
    _onCommentFocusLostSubject.close();
    _onAddCommentSubject.close();
    _onTryAgainSubject.close();
    _onAction.close();
  }
}
