import 'package:filmoow/presentation/common/loading_indicator.dart';
import 'package:filmoow/presentation/profile/filmow_sign_in/filmow_sign_in_bloc.dart';
import 'package:filmoow/presentation/profile/filmow_sign_in/filmow_sign_in_page.dart';
import 'package:filmoow/presentation/profile/filmow_sign_in/state/filmow_sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmowSignInContainer extends StatelessWidget {
  const FilmowSignInContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() => ProxyProvider0<FilmowSignInBloc>(
        update: (_, bloc) => FilmowSignInBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<FilmowSignInBloc>(
          builder: (_, bloc, __) => FilmowSignInContainer(
            bloc: bloc,
          ),
        ),
      );

  final FilmowSignInBloc bloc;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filmoow',
          ),
        ),
        body: SafeArea(
          child: StreamBuilder<FilmowSignInState>(
            stream: bloc.onNewState,
            builder: (_, snapshot) => Stack(
              children: [
                FilmowSignInPage(
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
