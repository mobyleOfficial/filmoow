import 'package:domain/model/content_list.dart';
import 'package:flutter/material.dart';

class AllListsPage extends StatelessWidget {
  const AllListsPage({
    required this.lists,
    Key? key,
  }) : super(key: key);

  final List<ContentList> lists;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: lists.length,
        itemBuilder: (_, index) => Text(
          lists[index].name,
        ),
      );
}
