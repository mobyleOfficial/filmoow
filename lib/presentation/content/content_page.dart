import 'package:filmoow/presentation/common/sizes.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_container.dart';
import 'package:filmoow/presentation/content/series_content/series_content_container.dart';
import 'package:filmoow/presentation/content/tv_content/tv_show_content_container.dart';
import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  int _tabIndex = 0;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Material(
            color: Theme.of(context).primaryColor,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: TabBar(
                controller: _controller,
                onTap: (_) {
                  setState(() {
                    _tabIndex = _controller.index;
                  });
                },
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(Sizes.dp8),
                    child: Text('Filmes'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Sizes.dp8),
                    child: Text('Séries'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Sizes.dp8),
                    child: Text('TV'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _tabIndex,
              children: [
                MovieContentContainer.create(),
                SeriesContentContainer.create(),
                TvShowContentContainer.create(),
              ],
            ),
          ),
        ],
      );
}
