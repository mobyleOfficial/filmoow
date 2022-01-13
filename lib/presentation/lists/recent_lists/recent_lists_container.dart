import 'package:domain/use_case/get_recent_lists_use_case.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/lists/recent_lists/recent_lists_bloc.dart';
import 'package:filmoow/presentation/lists/recent_lists/recent_lists_page.dart';
import 'package:filmoow/presentation/lists/recent_lists/state/recent_lists_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentListsContainer extends StatelessWidget {
  const RecentListsContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetRecentListsUseCase, RecentListsBloc>(
        update: (
          context,
          getRecentListsUseCase,
          bloc,
        ) =>
            bloc ??
            RecentListsBloc(
              getRecentListsUseCase: getRecentListsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<RecentListsBloc>(
          builder: (_, bloc, __) => RecentListsContainer(
            bloc: bloc,
          ),
        ),
      );

  final RecentListsBloc bloc;

  @override
  Widget build(BuildContext context) => StreamBuilder<RecentListsState>(
        stream: bloc.onNewState,
        builder: (_, snapshot) =>
            AsyncSnapshotResponseView<Loading, Success, Error>(
          snapshot: snapshot,
          successWidgetBuilder: (success) => RecentListsPage(
            lists: success.lists,
          ),
          errorWidgetBuilder: (error) {
            return Container();
          },
        ),
      );
}
