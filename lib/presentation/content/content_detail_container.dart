import 'package:domain/use_case/change_seen_status_use_case.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:domain/use_case/get_content_detail_use_case.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/content/content_detail_bloc.dart';
import 'package:filmoow/presentation/content/content_detail_page.dart';
import 'package:filmoow/presentation/content/state/content_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentDetailContainer extends StatelessWidget {
  const ContentDetailContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create(String id) => ProxyProvider3<
          GetContentDetailUseCase,
          ChangeSeenStatusUseCase,
          GetCommentListUseCase,
          ContentDetailBloc>(
        update: (
          context,
          getContentDetailUseCase,
          changeSeenStatusUseCase,
          getContentCommentsUseCase,
          bloc,
        ) =>
            bloc ??
            ContentDetailBloc(
              id: id,
              getContentDetailUseCase: getContentDetailUseCase,
              changeSeenStatusUseCase: changeSeenStatusUseCase,
              getContentCommentsUseCase: getContentCommentsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<ContentDetailBloc>(
          builder: (_, bloc, __) => ContentDetailContainer(
            bloc: bloc,
          ),
        ),
      );

  final ContentDetailBloc bloc;

  @override
  Widget build(BuildContext context) => StreamBuilder<ContentDetailState>(
        stream: bloc.onNewState,
        builder: (_, snapshot) =>
            AsyncSnapshotResponseView<Loading, Success, Error>(
          snapshot: snapshot,
          successWidgetBuilder: (success) => ContentDetailPage(
            contentId: bloc.getContentId(),
            contentDetail: success.contentDetail,
            changeSeenStatus: bloc.changeSeenStatus,
            onSeenStatus: bloc.onSeenStatus,
            commentList: success.commentList,
          ),
          errorWidgetBuilder: (error) => Container(
            color: Colors.red,
          ),
        ),
      );
}
