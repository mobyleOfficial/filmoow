import 'package:domain/use_case/get_series_list_use_case.dart';
import 'package:domain/use_case/get_tv_show_list_use_case.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_page.dart';
import 'package:filmoow/presentation/content/series_content/series_content_bloc.dart';
import 'package:filmoow/presentation/content/series_content/series_content_page.dart';
import 'package:filmoow/presentation/content/tv_content/tv_show_content_bloc.dart';
import 'package:filmoow/presentation/content/tv_content/tv_show_content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TvShowContentContainer extends StatelessWidget {
  const TvShowContentContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetTvShowListUseCase, TvShowsContentBloc>(
        update: (
          context,
          getTvShowListUseCase,
          bloc,
        ) =>
            bloc ??
            TvShowsContentBloc(
              getTvShowListUseCase: getTvShowListUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<TvShowsContentBloc>(
          builder: (_, bloc, __) => TvShowContentContainer(
            bloc: bloc,
          ),
        ),
      );

  final TvShowsContentBloc bloc;

  @override
  Widget build(BuildContext context) => TvShowContentPage(
        onNextListState: bloc.onNextState,
        requestNextPage: bloc.requestNextPage,
      );
}
