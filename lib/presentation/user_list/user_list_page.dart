import 'package:domain/model/user.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({
    required this.onNextUserListState,
    required this.requestNextPage,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<User, PaginationListingError>>
  onNextUserListState;
  final ValueChanged<int> requestNextPage;

  @override
  State<StatefulWidget> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final PagingController<int, User> _recentListController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _recentListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextUserListState.listen((listingState) {
      _recentListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, User>(
    pagingController: _recentListController,
    builderDelegate: PagedChildBuilderDelegate(
      itemBuilder: (_, user, index) => Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
          bottom: index == 0 ? 5 : 10,
        ),
        child: Text(
          user.name
        )
      ),
    ),
  );
}
