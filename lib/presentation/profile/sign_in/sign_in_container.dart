import 'package:filmoow/presentation/common/loading_indicator.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_bloc.dart';
import 'package:filmoow/presentation/profile/sign_in/sign_in_page.dart';
import 'package:filmoow/presentation/profile/sign_in/state/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider0<SignInBloc>(
        update: (_, bloc) => SignInBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<SignInBloc>(
          builder: (_, bloc, __) => SignInContainer(
            bloc: bloc,
          ),
        ),
      );

  final SignInBloc bloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filmoow',
          ),
        ),
        body: SafeArea(
          child: StreamBuilder<SignInState>(
            stream: bloc.onNewState,
            builder: (_, snapshot) => Stack(
              children: [
                SignInPage(
                  dismissLoading: () => bloc.dismissLoading(),
                  showLoading: () => bloc.showLoading(),
                ),
                if (snapshot.data is Loading)
                  Container(
                    color: Colors.white,
                    child: const LoadingIndicator(),
                  ),
              ],
            ),
          ),
        ),
      );
}
