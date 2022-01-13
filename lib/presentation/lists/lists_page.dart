import 'package:filmoow/presentation/common/sizes.dart';
import 'package:filmoow/presentation/lists/all_lists/all_lists_container.dart';
import 'package:filmoow/presentation/lists/popular_lists/popular_lists_container.dart';
import 'package:filmoow/presentation/lists/trending_lists/trending_lists_container.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with TickerProviderStateMixin {
  late TabController _controller;

  int _tabIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Listas'),
          ),
          bottom: TabBar(
            controller: _controller,
            onTap: (_) {
              setState(() {
                _tabIndex = _controller.index;
              });
            },
            tabs: const [
              Padding(
                padding: EdgeInsets.all(Sizes.dp8),
                child: Text('Geral'),
              ),
              Padding(
                padding: EdgeInsets.all(Sizes.dp8),
                child: Text('Popular'),
              ),
              Padding(
                padding: EdgeInsets.all(Sizes.dp8),
                child: Text('Destaques'),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: _tabIndex,
          children: [
            AllListsContainer.create(),
            PopularListsContainer.create(),
            TrendingListsContainer.create(),
          ],
        ),
      );
}
