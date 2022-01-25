import 'package:domain/use_case/get_movie_list_use_case.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_bloc.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MovieContentContainer extends StatelessWidget {
  const MovieContentContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetMovieListUseCase, MovieContentBloc>(
        update: (
          context,
          getMovieListUseCase,
          bloc,
        ) =>
            bloc ??
            MovieContentBloc(
              getMovieListUseCase: getMovieListUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<MovieContentBloc>(
          builder: (_, bloc, __) => MovieContentContainer(
            bloc: bloc,
          ),
        ),
      );

  final MovieContentBloc bloc;

  @override
  Widget build(BuildContext context) => MovieContentPage(
        onNextListState: bloc.onNextState,
        requestNextPage: bloc.requestNextPage,
      );
}
