import 'package:filmoow/presentation/common/sizes.dart';
import 'package:filmoow/presentation/content/movie_content/movie_content_container.dart';
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Conteúdos'),
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
        body: IndexedStack(
          index: _tabIndex,
          children: [
            MovieContentContainer.create(),
            Text('Séries'),
            Text('TV'),
          ],
        ),
      );
}
