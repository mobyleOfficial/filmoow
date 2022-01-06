import 'package:domain/model/comment.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/comment/widget/comment_card.dart';
import 'package:filmoow/presentation/common/form_text_field/edit_text.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

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

  final _editTextController = TextEditingController();
  final _enabledTextFieldFocusNode = FocusNode();
  final statusStream = PublishSubject<TextInputStatus>();
  bool _shouldShowCommentContainer = false;

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
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(Sizes.dp8),
                      child: InkWell(
                        onTap: () {
                          if(!_shouldShowCommentContainer) {
                            setState(() {
                              _shouldShowCommentContainer = true;
                            });
                          }
                        },
                        child: EditText(
                          editTextController: TextEditingController(),
                          enabled: false,
                          onChanged: (String value) {},
                          statusStream: statusStream,
                          hint: 'Digite o seu comentário',
                        ),
                      ),
                    ),
                  ),
                  PagedSliverList<int, Comment>(
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
                ],
              ),
              if (_shouldShowCommentContainer)
                InkWell(
                  onTap: (){
                    setState(() {
                      _shouldShowCommentContainer = false;
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black87.withOpacity(0.5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: EditText(
                        editTextController: _editTextController,
                        focusNode: _enabledTextFieldFocusNode,
                        suffixIcon: Icons.send,
                        onSuffixIconPressed: (){
                          //todo: do something
                        },
                        onChanged: (text) {
                          //todo: do something
                          
                        },
                        onEditingComplete: () {
                          //todo: do something
                        },
                        autoFocus: true,
                        statusStream: statusStream,
                        hint: 'Digite o seu comentário',
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _commentListController.dispose();
    _editTextController.dispose();
    _enabledTextFieldFocusNode.dispose();
    super.dispose();
  }
}
