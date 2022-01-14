import 'package:domain/model/comment.dart';
import 'package:domain/use_case/add_comment_use_case.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:filmoow/presentation/common/comment/action/comment_list_actions.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:filmoow/presentation/common/pagination/pagination_bloc.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:rxdart/rxdart.dart';

class CommentListBloc extends PaginationBloc<Comment, PaginationListingError> {
  CommentListBloc({
    required this.id,
    required this.getCommentListUseCase,
    required this.addCommentUseCase,
  }) {
    MergeStream(
      [
        onNexPageRequestSubject.stream.flatMap(_getCommentList),
        _onTryAgainSubject.flatMap(
          (_) => _getCommentList(0),
        )
      ],
    ).listen(onNextStateSubject.add).addTo(subscriptions);

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

  final statusStream = PublishSubject<TextInputStatus>();
  final _onAction = PublishSubject<CommentListActions>();

  int _page = 1;

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

  Stream<PaginationListingState<Comment, PaginationListingError>> _getCommentList(int offset) async* {
    final lastListingState = onNextStateSubject.value;

    try {
      if (lastListingState.list != null) {
        _page++;
      }

      final commentListing = await getCommentListUseCase(
        GetCommentListUseCaseParams(
          page: _page,
          id: id,
        ),
      );

      yield PaginationListingState<Comment, PaginationListingError>(
        nextOffset: commentListing.hasNext ? _page : null,
        list: [
          ...lastListingState.list ?? [],
          ...commentListing.commentList
        ],
      );
    } catch (error) {
      yield PaginationListingState<Comment, PaginationListingError>(
        error: PaginationListingError(),
        nextOffset: lastListingState.nextOffset,
        list: lastListingState.list,
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

      onNextStateSubject.add(
        const PaginationListingState<Comment, PaginationListingError>(),
      );

      _onAction.add(DismissCommentAction());

      _onTryAgainSubject.add(null);
    } catch (error) {
      //todo: do somethinng
    }
  }

  @override
  void dispose() {
    super.dispose();
    statusStream.close();
    _onCommentValueChangedSubject.close();
    _commentInputStatusSubject.close();
    _onCommentFocusLostSubject.close();
    _onAddCommentSubject.close();
    _onTryAgainSubject.close();
    _onAction.close();
  }
}
