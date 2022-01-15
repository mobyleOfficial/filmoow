import 'package:domain/use_case/get_users_lists_use_case.dart';
import 'package:filmoow/presentation/user_list/user_list_bloc.dart';
import 'package:filmoow/presentation/user_list/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserListContainer extends StatelessWidget {
  const UserListContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider<GetUserListsUseCase, UserListBloc>(
        update: (
          context,
          getUserListsUseCase,
          bloc,
        ) =>
            bloc ??
            UserListBloc(
              getUserListsUseCase: getUserListsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<UserListBloc>(
          builder: (_, bloc, __) => UserListContainer(
            bloc: bloc,
          ),
        ),
      );

  final UserListBloc bloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Usuários'),
          ),
        ),
        body: UserListPage(
          onNextUserListState: bloc.onNextState,
          requestNextPage: bloc.requestNextPage,
        ),
      );
}
