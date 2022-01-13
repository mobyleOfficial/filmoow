import 'package:domain/use_case/get_all_lists_use_case.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/lists/all_lists/all_lists_bloc.dart';
import 'package:filmoow/presentation/lists/all_lists/all_lists_page.dart';
import 'package:filmoow/presentation/lists/all_lists/state/all_lists_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllListsContainer extends StatelessWidget {
  const AllListsContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider<GetAllListsUseCase, AllListsBloc>(
        update: (
          context,
          getAllListsUseCase,
          bloc,
        ) =>
            bloc ??
            AllListsBloc(
              getAllListsUseCase: getAllListsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<AllListsBloc>(
          builder: (_, bloc, __) => AllListsContainer(
            bloc: bloc,
          ),
        ),
      );

  final AllListsBloc bloc;

  @override
  Widget build(BuildContext context) => StreamBuilder<AllListsState>(
        stream: bloc.onNewState,
        builder: (_, snapshot) =>
            AsyncSnapshotResponseView<Loading, Success, Error>(
          snapshot: snapshot,
          successWidgetBuilder: (success) => AllListsPage(
            lists: success.lists,
          ),
          errorWidgetBuilder: (error) {
            return Container();
          },
        ),
      );
}
