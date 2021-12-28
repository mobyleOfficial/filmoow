import 'package:action_handler/action_handler.dart';
import 'package:domain/use_case/sign_in_use_case.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/loading_indicator.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_bloc.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_page.dart';
import 'package:filmoow/presentation/profile/sign_in/state/sign_in_action.dart';
import 'package:filmoow/presentation/profile/sign_in/state/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider<SignInUseCase, SignInBloc>(
        update: (_, signInUseCase, bloc) =>
            bloc ??
            SignInBloc(
              signInUseCase: signInUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<SignInBloc>(
          builder: (_, bloc, __) => SignInContainer(
            bloc: bloc,
          ),
        ),
      );

  final SignInBloc bloc;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: ActionHandler<SignInAction>(
            actionInput: bloc.onNewAction,
            actionResult: (action) {
              if (action is NavigateToUserProfile) {
                Navigator.of(context).pushReplacementNamed(
                  RouteNameBuilder.getProfileRoute(),
                );
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<SignInState>(
                stream: bloc.onNewState,
                builder: (_, snapshot) {
                  if (snapshot.data is Loading) {
                    return const LoadingIndicator();
                  }

                  return SignInPage(
                    signIn: (token) => bloc.signIn(token),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
