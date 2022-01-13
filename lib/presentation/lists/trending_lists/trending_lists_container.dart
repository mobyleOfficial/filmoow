import 'package:flutter/material.dart';

class TrendingListsContainer extends StatelessWidget {
  const TrendingListsContainer({
    Key? key,
  }) : super(key: key);

  static Widget create() => const TrendingListsContainer();

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: 1000,
        itemBuilder: (_, index) => Text('$index  Lista Destaque'),
      );
}
