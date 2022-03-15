import 'package:domain/use_case/get_movie_list_use_case.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/content/common/content_list_page.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_bloc.dart';
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
  Widget build(BuildContext context) => ContentListPage(
        onNextListState: bloc.onNextState,
        requestNextPage: bloc.requestNextPage,
        onSearch: (query) => bloc.onSearch(query ?? ''),
        onTap: (id) => Navigator.of(context).pushNamed(
          RouteNameBuilder.getContentDetailRoute(),
          arguments: id,
        ),
      );
}
