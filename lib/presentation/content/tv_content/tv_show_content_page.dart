import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/pagination/pagination_state.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class TvShowContentPage extends StatefulWidget {
  const TvShowContentPage({
    required this.onNextListState,
    required this.requestNextPage,
    Key? key,
  }) : super(key: key);

  final Stream<PaginationListingState<TvShow, PaginationListingError>>
      onNextListState;
  final ValueChanged<int> requestNextPage;

  @override
  State<StatefulWidget> createState() => _TvShowContentPageState();
}

class _TvShowContentPageState extends State<TvShowContentPage> {
  final PagingController<int, TvShow> _tvShowsListController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _tvShowsListController.addPageRequestListener(widget.requestNextPage);

    widget.onNextListState.listen((listingState) {
      _tvShowsListController.value = PagingState(
        nextPageKey: listingState.nextOffset,
        error: listingState.error,
        itemList: listingState.list,
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PagedGridView<int, TvShow>(
        pagingController: _tvShowsListController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (_, tvShow, index) => GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              RouteNameBuilder.getContentDetailRoute(),
              arguments: tvShow.id,
            ),
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
                      imageUrl: tvShow.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (tvShow.score != null)
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
                                  tvShow.score!.toString(),
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
                  // if (movie.status != SeenStatus.notSeen)
                  //   Positioned(
                  //     bottom: 80,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Container(
                  //         color: movie.status == SeenStatus.seen
                  //             ? Colors.green.withOpacity(0.9)
                  //             : Colors.yellow.withOpacity(0.9),
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(
                  //             Sizes.dp8,
                  //           ),
                  //           child: Text(
                  //             movie.status == SeenStatus.seen
                  //                 ? 'Visto'
                  //                 : 'Quero ver',
                  //             textAlign: TextAlign.center,
                  //             style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
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
