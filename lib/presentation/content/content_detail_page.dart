import 'dart:ui';

import 'package:domain/model/actor.dart';
import 'package:domain/model/content_classification.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/recommended_content.dart';
import 'package:domain/model/seen_status.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/async_snapshot_response_view.dart';
import 'package:filmoow/presentation/common/filmoow_assets.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:filmoow/presentation/content/state/seen_status_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage({
    required this.contentDetail,
    required this.changeSeenStatus,
    required this.onSeenStatus,
    Key? key,
  }) : super(key: key);

  final ContentDetail contentDetail;
  final Function(SeenStatus status) changeSeenStatus;
  final Stream<SeenStatusState> onSeenStatus;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            contentDetail.title,
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (selected) {
                late SeenStatus status;

                switch (selected) {
                  case 'Marcar como visto':
                    status = SeenStatus.seen;
                    break;

                  case 'Marcar como NÃO visto':
                    status = SeenStatus.notSeen;
                    break;

                  case 'Marcar como quero ver':
                    status = SeenStatus.wantToSee;
                    break;
                }

                changeSeenStatus(status);
              },
              itemBuilder: (context) => {
                'Marcar como visto',
                'Marcar como NÃO visto',
                'Marcar como quero ver'
              }
                  .map(
                    (choice) => PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        body: Center(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    _CoverImage(
                      coverImage: contentDetail.coverImages.first,
                    ),
                    _ContentDetailBody(
                      title: contentDetail.title,
                      originalTitle: contentDetail.originalTitle,
                      duration: contentDetail.duration,
                      description: contentDetail.description,
                      genres: contentDetail.genres,
                      actorList: contentDetail.actorList,
                      recommendedContent: contentDetail.recommendedContent,
                      classification: contentDetail.movieClassification,
                      userScore: contentDetail.userScore,
                      generalScore: contentDetail.generalScore,
                      scoreQuantity: contentDetail.scoreQuantity,
                      releaseYear: contentDetail.releaseYear,
                      onSeenStatus: onSeenStatus,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}

class _CoverImage extends StatelessWidget {
  const _CoverImage({
    required this.coverImage,
    Key? key,
  }) : super(key: key);

  final String coverImage;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: RemoteImage(
              imageUrl: coverImage,
            ),
          ),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 3,
                  sigmaY: 3,
                ),
                child: Container(
                  color: Colors.grey.withOpacity(0.1),
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 220,
              width: 150,
              child: Material(
                elevation: 10,
                shadowColor: Colors.black,
                child: RemoteImage(
                  fit: BoxFit.fill,
                  imageUrl: coverImage,
                ),
              ),
            ),
          ),
        ],
      );
}

class _ContentDetailBody extends StatelessWidget {
  const _ContentDetailBody({
    required this.title,
    required this.originalTitle,
    required this.duration,
    required this.description,
    required this.genres,
    required this.actorList,
    required this.recommendedContent,
    required this.classification,
    required this.generalScore,
    required this.userScore,
    required this.scoreQuantity,
    required this.releaseYear,
    required this.onSeenStatus,
    Key? key,
  }) : super(key: key);

  final String title;
  final String originalTitle;
  final String duration;
  final String description;
  final List<String> genres;
  final List<Actor> actorList;
  final List<RecommendedContent> recommendedContent;
  final ContentClassification classification;
  final double? generalScore;
  final double? userScore;
  final int? scoreQuantity;
  final int releaseYear;
  final Stream<SeenStatusState> onSeenStatus;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    originalTitle,
                    maxLines: 4,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      Text(
                        releaseYear.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      Text(
                        duration,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      SvgPicture.asset(
                        _getClassificationAsset(
                          classification,
                        ),
                        width: 20,
                        height: 20,
                        matchTextDirection: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Média Geral',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          generalScore?.toString() ?? 'N/A',
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Votos: ${scoreQuantity?.toString() ?? 'N/A'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.solidStar,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          ((userScore ?? 0) / 2).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Sua nota',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      ' ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: _SeenStatus(
                        onSeenStatus: onSeenStatus,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (genres.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: [
                    ...genres.map(
                      (genre) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              genre,
                              style: const TextStyle(
                                color: Colors.white,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Descrição',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          if (actorList.isNotEmpty)
            _ActorList(
              actorsList: actorList,
            ),
          if (recommendedContent.isNotEmpty)
            _RecommendedContentList(
              recommendedContentList: recommendedContent,
            ),
        ],
      );

  String _getClassificationAsset(ContentClassification classification) {
    String assetName;
    switch (classification) {
      case ContentClassification.L:
        assetName = FilmoowAssets.getLClassification();
        break;
      case ContentClassification.ten:
        assetName = FilmoowAssets.getTenClassification();
        break;
      case ContentClassification.twelve:
        assetName = FilmoowAssets.getTwelveClassification();
        break;
      case ContentClassification.fourteen:
        assetName = FilmoowAssets.getFourteenClassification();
        break;
      case ContentClassification.sixteen:
        assetName = FilmoowAssets.getSixteenClassification();
        break;
      case ContentClassification.eighteen:
        assetName = FilmoowAssets.getEighteenClassification();
        break;
      default:
        assetName = '';
        break;
    }

    return assetName;
  }
}

class _ActorList extends StatelessWidget {
  const _ActorList({
    required this.actorsList,
    Key? key,
  }) : super(key: key);

  final List<Actor> actorsList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Elenco',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...actorsList.map(
                    (actor) => Container(
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    actor.photoUrl,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              actor.name,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _RecommendedContentList extends StatelessWidget {
  const _RecommendedContentList({
    required this.recommendedContentList,
    Key? key,
  }) : super(key: key);

  final List<RecommendedContent> recommendedContentList;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recomendados',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...recommendedContentList.map(
                    (content) => Center(
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                          RouteNameBuilder.getContentDetailRoute(),
                          arguments: content.id,
                        ),
                        child: Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                content.imageUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _SeenStatus extends StatelessWidget {
  const _SeenStatus({
    required this.onSeenStatus,
    Key? key,
  }) : super(key: key);

  final Stream<SeenStatusState> onSeenStatus;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: onSeenStatus,
        builder: (_, snapshot) =>
            AsyncSnapshotResponseView<StatusLoading, StatusSuccess, StatusError>(
          snapshot: snapshot,
          successWidgetBuilder: (success) {
            final seenStatus = success.status;

            if (seenStatus == SeenStatus.seen) {
              return Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.eye,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ja vi!',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }

            if (seenStatus == SeenStatus.notSeen) {
              return Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.eyeSlash,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Não vi!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }

            if (seenStatus == SeenStatus.wantToSee) {
              return Row(
                children: const [
                  FaIcon(
                    FontAwesomeIcons.clock,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Quero ver!',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
          errorWidgetBuilder: (_) => const SizedBox(),
        ),
      );
}
