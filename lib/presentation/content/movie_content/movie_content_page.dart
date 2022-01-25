import 'package:domain/model/movie.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MovieContentPage extends StatefulWidget {
  const MovieContentPage({
    required this.onNextListState,
    required this.requestNextPage,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<Movie, PaginationListingError>>
      onNextListState;
  final ValueChanged<int> requestNextPage;

  @override
  State<StatefulWidget> createState() => _MovieContentPageState();
}

class _MovieContentPageState extends State<MovieContentPage> {
  final PagingController<int, Movie> _movieListController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _movieListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextListState.listen((listingState) {
      _movieListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Movie>(
        pagingController: _movieListController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, movie, index) => Text(
            movie.name,
          ),
        ),
      );
}
