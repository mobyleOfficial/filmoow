import 'package:domain/model/content_list.dart';
import 'package:filmoow/presentation/common/cards/list_card.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class RecentListsPage extends StatefulWidget {
  const RecentListsPage({
    required this.onNextCommentListState,
    required this.requestNextPage,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<ContentList, PaginationListingError>>
      onNextCommentListState;
  final ValueChanged<int> requestNextPage;

  @override
  State<StatefulWidget> createState() => _RecentListsPageState();
}

class _RecentListsPageState extends State<RecentListsPage> {
  final PagingController<int, ContentList> _recentListController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _recentListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextCommentListState.listen((listingState) {
      _recentListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, ContentList>(
        pagingController: _recentListController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, list, index) => ListsCard(
            name: list.name,
            imageList: list.imagesList,
            isLast: false,
            listSize: list.stats.listSize,
            likes: list.stats.likesQuantity,
            comments: list.stats.commentsQuantity,
            creation: '',
          ),
        ),
      );
}
