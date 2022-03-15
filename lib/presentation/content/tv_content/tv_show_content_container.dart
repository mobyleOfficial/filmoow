import 'package:domain/use_case/get_tv_show_list_use_case.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/content/common/content_list_page.dart';
import 'package:filmoow/presentation/content/tv_content/tv_show_content_bloc.dart';
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
