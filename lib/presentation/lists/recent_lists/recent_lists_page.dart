import 'package:domain/model/content_list.dart';
import 'package:flutter/material.dart';

class RecentListsPage extends StatelessWidget {
  const RecentListsPage({
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
