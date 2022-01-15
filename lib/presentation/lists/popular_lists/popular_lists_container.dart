import 'package:domain/use_case/get_popular_lists_use_case.dart';
import 'package:filmoow/presentation/lists/popular_lists/popular_lists_bloc.dart';
import 'package:filmoow/presentation/lists/popular_lists/popular_lists_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularListsContainer extends StatelessWidget {
  const PopularListsContainer({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  static Widget create() =>
      ProxyProvider<GetPopularListsUseCase, PopularListsBloc>(
        update: (
          context,
          getPopularListsUseCase,
          bloc,
        ) =>
            bloc ??
            PopularListsBloc(
              getPopularListsUseCase: getPopularListsUseCase,
            ),
        dispose: (_, bloc) => bloc.dispose(),
        child: Consumer<PopularListsBloc>(
          builder: (_, bloc, __) => PopularListsContainer(
            bloc: bloc,
          ),
        ),
      );

  final PopularListsBloc bloc;

  @override
  Widget build(BuildContext context) => PopularListsPage(
        onNextCommentListState: bloc.onNextState,
        requestNextPage: bloc.requestNextPage,
      );
}
