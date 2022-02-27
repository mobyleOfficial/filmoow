import 'package:domain/model/user.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
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
  final PagingController<int, User> _userListController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _userListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextUserListState.listen((listingState) {
      _userListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedGridView<int, User>(
    pagingController: _userListController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    builderDelegate: PagedChildBuilderDelegate(
      itemBuilder: (_, user, index) => GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
              child: RemoteImage(
                width: 70,
                height: 150,
                imageUrl: user.photoUrl,
              ),
            ),
            Text(user.name),
          ],
        ),
      ),
      firstPageErrorIndicatorBuilder: (_) => Container(),
      newPageErrorIndicatorBuilder: (_) => TextButton(
        onPressed: () {},
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(
              8,
            ),
            child: Icon(
              Icons.refresh_outlined,
            ),
          ),
        ),
      ),
    ),
  );
}
