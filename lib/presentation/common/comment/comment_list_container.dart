import 'package:filmoow/presentation/common/comment/comment_list_bloc.dart';
import 'package:filmoow/presentation/common/comment/comment_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';
import 'package:domain/use_case/add_comment_use_case.dart';

class CommentListContainer extends StatelessWidget {
  const CommentListContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create(String id) =>
      ProxyProvider2<GetCommentListUseCase, AddCommentUseCase, CommentListBloc>(
        update: (
          context,
          getCommentListUseCase,
          addCommentUseCase,
          bloc,
        ) =>
            bloc ??
            CommentListBloc(
              id: id,
              getCommentListUseCase: getCommentListUseCase,
              addCommentUseCase: addCommentUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<CommentListBloc>(
          builder: (_, bloc, __) => CommentListContainer(
            bloc: bloc,
          ),
        ),
      );

  final CommentListBloc bloc;

  @override
  Widget build(BuildContext context) => CommentListPage(
        onNextCommentListState: bloc.onNextCommentListState,
        requestNextPage: bloc.requestNextPage,
        onTryAgain: () {
          //todo: Add try agaon
        },
        addComment: () => bloc.onAddComment(),
        onTextChanged: bloc.onCommentValueChangedSink.add,
        onFocusLost: () => bloc.onCommentFocusLostSink.add(null),
        statusStream: bloc.statusStream,
        actionListener: bloc.onAction,
      );
}
