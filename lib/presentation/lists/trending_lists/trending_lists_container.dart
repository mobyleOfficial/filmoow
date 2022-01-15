import 'package:domain/use_case/get_treding_lists_use_case.dart';
import 'package:filmoow/presentation/lists/trending_lists/trending_lists_bloc.dart';
import 'package:filmoow/presentation/lists/trending_lists/trending_lists_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrendingListsContainer extends StatelessWidget {
  const TrendingListsContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetTrendingListsUseCase, TrendingListsBloc>(
        update: (
            context,
            getTrendingListsUseCase,
            bloc,
            ) =>
        bloc ??
            TrendingListsBloc(
              getTrendingListsUseCase: getTrendingListsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<TrendingListsBloc>(
          builder: (_, bloc, __) => TrendingListsContainer(
            bloc: bloc,
          ),
        ),
      );

  final TrendingListsBloc bloc;

  @override
  Widget build(BuildContext context) => TrendingListsPage(
    onNextCommentListState: bloc.onNextState,
    requestNextPage: bloc.requestNextPage,
  );
}
