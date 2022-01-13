import 'package:filmoow/presentation/lists/lists_page.dart';
import 'package:flutter/material.dart';

class ListsContainer extends StatelessWidget {
  const ListsContainer({
    Key? key,
  }) : super(key: key);

  static Widget create() => const ListsContainer();

  @override
  Widget build(BuildContext context) => const ListPage();
}
