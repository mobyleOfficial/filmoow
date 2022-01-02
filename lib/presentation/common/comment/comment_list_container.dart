import 'package:filmoow/presentation/common/comment/comment_list_bloc.dart';
import 'package:filmoow/presentation/common/comment/comment_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domain/use_case/get_comment_list_use_case.dart';

class CommentListContainer extends StatelessWidget {
  const CommentListContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create(String id) =>
      ProxyProvider<GetCommentListUseCase, CommentListBloc>(
        update: (
          context,
          getCommentListUseCase,
          bloc,
        ) =>
            bloc ??
            CommentListBloc(
              id: id,
              getCommentListUseCase: getCommentListUseCase,
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
  Widget build(BuildContext context) => CommentListPage.create(
    bloc.onNextCommentListState,
    bloc.requestNextPage,
    (){},
  );
}
