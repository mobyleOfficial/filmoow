import 'package:domain/model/comment.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/comment/widget/comment_card.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentListPage extends StatefulWidget {
  const CommentListPage({
    required this.onNextCommentListState,
    required this.requestNextPage,
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  static Widget create(
    Stream<CommentListingState> onNextCommentListState,
    ValueChanged<int> requestNextPage,
    VoidCallback onTryAgain,
  ) =>
      CommentListPage(
        onNextCommentListState: onNextCommentListState,
        requestNextPage: requestNextPage,
        onTryAgain: onTryAgain,
      );

  final Stream<CommentListingState> onNextCommentListState;
  final ValueChanged<int> requestNextPage;
  final VoidCallback onTryAgain;

  @override
  State<StatefulWidget> createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage>
    with SubscriptionHolder {
  final PagingController<int, Comment> _commentListController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _commentListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextCommentListState.listen((listingState) {
      _commentListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.commentList,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Comentários',
          ),
        ),
        body: SafeArea(
          child: PagedListView<int, Comment>(
            pagingController: _commentListController,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, comment, index) => GestureDetector(
                onTap: () {},
                child: CommentCard(
                  comment: comment,
                ),
              ),
              firstPageErrorIndicatorBuilder: (_) => Container(),
              newPageErrorIndicatorBuilder: (_) => TextButton(
                onPressed: widget.onTryAgain,
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
          ),
        ),
      );

  @override
  void dispose() {
    _commentListController.dispose();
    super.dispose();
  }
}
