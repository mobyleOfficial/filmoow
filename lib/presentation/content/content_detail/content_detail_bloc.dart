import 'package:domain/model/comment.dart';
import 'package:domain/model/comment_listing.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/use_case/change_seen_status_use_case.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:filmoow/presentation/content/content_detail/state/content_detail_state.dart';
import 'package:filmoow/presentation/content/content_detail/state/seen_status_state.dart';
import 'package:rxdart/rxdart.dart';

class ContentDetailBloc with SubscriptionHolder {
  ContentDetailBloc({
    required this.id,
    required this.getContentDetailUseCase,
    required this.changeSeenStatusUseCase,
    required this.getContentCommentsUseCase,
  }) {
    MergeStream([
      _getContentDetail(id),
    ]).listen(_onNewState.add)
        .addTo(subscriptions);
  }

  final String id;
  final GetContentDetailUseCase getContentDetailUseCase;
  final ChangeSeenStatusUseCase changeSeenStatusUseCase;
  final GetCommentListUseCase getContentCommentsUseCase;
  final BehaviorSubject<ContentDetailState> _onNewState =
      BehaviorSubject<ContentDetailState>();
  final BehaviorSubject<SeenStatusState> _onSeenStatus =
      BehaviorSubject<SeenStatusState>();

  Stream<ContentDetailState> get onNewState => _onNewState;

  Stream<SeenStatusState> get onSeenStatus => _onSeenStatus;

  Stream<ContentDetailState> _getContentDetail(String id) async* {
    try {
      final response = await Future.wait(
        [
          getContentDetailUseCase(id),
          getContentCommentsUseCase(
            GetCommentListUseCaseParams(
              page: 1,
              id: getContentId(),
            ),
          ),
        ],
        eagerError: true,
      );

      final contentDetail = response[0] as ContentDetail;
      final commentListing = response[1] as CommentListing;

      _onSeenStatus.value = StatusSuccess(
        status: contentDetail.seenStatus,
      );

      var commentList = <Comment>[];

      if (commentListing.commentList.length > 3) {
        commentList = commentListing.commentList.sublist(0, 3);
      } else {
        commentList = commentListing.commentList;
      }

      yield Success(
        contentDetail: contentDetail,
        commentList: commentList,
      );
    } catch (error) {
      yield Error();
    }
  }

  Future<void> changeSeenStatus(
    SeenStatus status,
  ) async {
    _onSeenStatus.value = StatusLoading();

    try {
      await changeSeenStatusUseCase(
        ChangeSeenStatusUseCaseParams(
          id: getContentId(),
          status: status,
        ),
      );

      _onSeenStatus.value = StatusSuccess(
        status: status,
      );
    } catch (error) {
      //todo: do something
    }
  }

  void dispose() {
    _onNewState.close();
    _onSeenStatus.close();
  }

  String getContentId() => id.split('-').last.replaceAll('t', '').replaceAll('/', '');
}
