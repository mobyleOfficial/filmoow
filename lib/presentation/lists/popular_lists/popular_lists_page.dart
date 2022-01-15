import 'package:domain/model/content_list.dart';
import 'package:filmoow/presentation/common/cards/list_card.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PopularListsPage extends StatefulWidget {
  const PopularListsPage({
    required this.onNextCommentListState,
    required this.requestNextPage,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<ContentList, PaginationListingError>>
  onNextCommentListState;
  final ValueChanged<int> requestNextPage;

  @override
  State<StatefulWidget> createState() => _PopularListsPageState();
}

class _PopularListsPageState extends State<PopularListsPage> {
  final PagingController<int, ContentList> _popularListController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _popularListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextCommentListState.listen((listingState) {
      _popularListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, ContentList>(
    pagingController: _popularListController,
    builderDelegate: PagedChildBuilderDelegate(
      itemBuilder: (_, list, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: index == 0 ? 24 : 4,
        ),
        child: ListsCard(
          name: list.name,
          imageList: list.imagesList,
          isLast: true,
          listSize: list.stats.listSize,
          likes: list.stats.likesQuantity,
          comments: list.stats.commentsQuantity,
          creation: '',
        ),
      ),
    ),
  );
}
