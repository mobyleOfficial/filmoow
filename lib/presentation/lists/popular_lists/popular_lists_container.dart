import 'package:flutter/material.dart';

class PopularListsContainer extends StatelessWidget {
  const PopularListsContainer({
    Key? key,
  }) : super(key: key);

  static Widget create() => const PopularListsContainer();

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: 1000,
        itemBuilder: (_, index) => Text('$index Lista Popular'),
      );
}
