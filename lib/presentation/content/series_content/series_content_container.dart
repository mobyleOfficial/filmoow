import 'package:domain/use_case/get_series_list_use_case.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/content/common/content_list_page.dart';
import 'package:filmoow/presentation/content/series_content/series_content_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SeriesContentContainer extends StatelessWidget {
  const SeriesContentContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetSeriesListUseCase, SeriesContentBloc>(
        update: (
          context,
          getSeriesListUseCase,
          bloc,
        ) =>
            bloc ??
            SeriesContentBloc(
              getSeriesListUseCase: getSeriesListUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<SeriesContentBloc>(
          builder: (_, bloc, __) => SeriesContentContainer(
            bloc: bloc,
          ),
        ),
      );

  final SeriesContentBloc bloc;

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
