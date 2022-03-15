import 'package:domain/model/content.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/model/series.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/form_text_field/edit_text.dart';
import 'package:filmoow/presentation/common/form_text_field/text_input_status.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/rxdart.dart';

class ContentListPage extends StatefulWidget {
  const ContentListPage({
    required this.onNextListState,
    required this.requestNextPage,
    required this.onSearch,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<Content, PaginationListingError>>
      onNextListState;
  final ValueChanged<int> requestNextPage;
  final ValueChanged<String?> onSearch;
  final ValueChanged<String> onTap;

  @override
  State<StatefulWidget> createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {
  final PagingController<int, Content> _contentListController =
      PagingController(firstPageKey: 0);

  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _contentListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextListState.listen((listingState) {
      _contentListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.dp8),
              child: EditText(
                editTextController: _textEditingController,
                focusNode: _focusNode,
                onChanged: widget.onSearch,
                onEditingComplete: () {
                  _focusNode.unfocus();
                },
                textInputAction: TextInputAction.done,
                statusStream: BehaviorSubject<TextInputStatus>(),
                hint: 'Pesquisar',
              ),
            ),
          ),
          PagedSliverGrid<int, Content>(
            pagingController: _contentListController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, content, index) => GestureDetector(
                onTap: () => widget.onTap(content.id),
                child: Padding(
                  padding: const EdgeInsets.all(
                    Sizes.dp8,
                  ),
                  child: Stack(
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        elevation: 5,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: RemoteImage(
                          imageUrl: content.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (content.score != null)
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                  ),
                                  color: Colors.yellow.withOpacity(0.9),
                                  child: Center(
                                    child: Text(
                                      content.score!.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (content.status != SeenStatus.notSeen)
                        Positioned(
                          bottom: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              color: content.status == SeenStatus.seen
                                  ? Colors.green.withOpacity(0.9)
                                  : Colors.yellow.withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.all(
                                  Sizes.dp8,
                                ),
                                child: Text(
                                  content.status == SeenStatus.seen
                                      ? 'Visto'
                                      : 'Quero ver',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              firstPageProgressIndicatorBuilder: (_) => SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
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
          ),
        ],
      );

  @override
  void dispose() {
    _textEditingController
      ..clear()
      ..dispose();

    _focusNode.dispose();
    super.dispose();
  }
}
