import 'package:action_handler/action_handler.dart';
import 'package:domain/model/comment.dart';
import 'package:filmoow/presentation/common/comment/action/comment_list_actions.dart';
import 'package:filmoow/presentation/common/comment/state/comment_list_state.dart';
import 'package:filmoow/presentation/common/comment/widget/comment_card.dart';
import 'package:filmoow/presentation/common/form_text_field/edit_text.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:filmoow/presentation/common/subscription_holder.dart';
import 'package:filmoow/presentation/common/view_utils.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentListPage extends StatefulWidget {
  const CommentListPage({
    required this.onNextCommentListState,
    required this.requestNextPage,
    required this.onTryAgain,
    required this.addComment,
    required this.onTextChanged,
    required this.onFocusLost,
    required this.statusStream,
    required this.actionListener,
    Key? key,
  }) : super(key: key);

  final Stream<CommentListingState> onNextCommentListState;
  final ValueChanged<int> requestNextPage;
  final VoidCallback onTryAgain;
  final VoidCallback addComment;
  final ValueChanged<String> onTextChanged;
  final VoidCallback onFocusLost;
  final Stream<TextInputStatus> statusStream;
  final Stream<CommentListActions> actionListener;

  @override
  State<StatefulWidget> createState() => _CommentListPageState();
}

class _CommentListPageState extends State<CommentListPage>
    with SubscriptionHolder {
  VoidCallback get addComment => widget.addComment;

  ValueChanged<String> get onTextChanged => widget.onTextChanged;

  Stream<TextInputStatus> get statusStream => widget.statusStream;
  final PagingController<int, Comment> _commentListController =
      PagingController(firstPageKey: 0);

  final _editTextController = TextEditingController();
  final _enabledTextFieldFocusNode = FocusNode();
  bool _isShowingCommentContainer = false;

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
  void didChangeDependencies() {
    _enabledTextFieldFocusNode.addFocusLostListener(
      () => widget.onFocusLost(),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => ActionHandler<CommentListActions>(
        actionInput: widget.actionListener,
        actionResult: (event) {
          if (event is DismissCommentAction) {
            if (_isShowingCommentContainer) {
              setState(() {
                _isShowingCommentContainer = false;
              });
              _editTextController.clear();
            }
          }
        },
        child: Scaffold(
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
                            if (!_isShowingCommentContainer) {
                              setState(() {
                                _isShowingCommentContainer = true;
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
                if (_isShowingCommentContainer)
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isShowingCommentContainer = false;
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
                          onSuffixIconPressed: () => addComment(),
                          onChanged: onTextChanged,
                          onEditingComplete: () => addComment(),
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
