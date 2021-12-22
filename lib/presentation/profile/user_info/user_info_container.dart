import 'package:action_handler/action_handler.dart';
import 'package:filmoow/presentation/common/loading_indicator.dart';
import 'package:filmoow/presentation/profile/user_info/state/user_info_action.dart';
import 'package:filmoow/presentation/profile/user_info/state/user_info_state.dart';
import 'package:filmoow/presentation/profile/user_info/user_info_bloc.dart';
import 'package:filmoow/presentation/profile/user_info/user_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:domain/use_case/sign_in_use_case.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider<SignInUseCase, UserInfoBloc>(
        update: (_, signInUseCase, bloc) =>
            bloc ??
            UserInfoBloc(
              signInUseCase: signInUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<UserInfoBloc>(
          builder: (_, bloc, __) => UserInfoContainer(
            bloc: bloc,
          ),
        ),
      );

  final UserInfoBloc bloc;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: ActionHandler<UserInfoAction>(
            actionInput: bloc.onNewAction,
            actionResult: (action) {
              if (action is NavigateToUserProfile) {
                print('LOGOUUU');
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<UserInfoState>(
                stream: bloc.onNewState,
                builder: (_, snapshot) {
                  if (snapshot.data is Loading) {
                    return const LoadingIndicator();
                  }

                  return UserInfoPage(
                    signIn: (token) => bloc.signIn(token),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
