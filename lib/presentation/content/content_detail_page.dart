import 'package:domain/model/actor.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/recommended_content.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage({
    required this.contentDetail,
    Key? key,
  }) : super(key: key);

  final ContentDetail contentDetail;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            contentDetail.title,
          ),
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
                      userScore: contentDetail.userScore,
                      generalScore: contentDetail.generalScore,
                      scoreQuantity: contentDetail.scoreQuantity,
                    ),
                    _ContentDetailBody(
                      title: contentDetail.title,
                      originalTitle: contentDetail.originalTitle,
                      duration: contentDetail.duration,
                      description: contentDetail.description,
                      genres: contentDetail.genres,
                      actorList: contentDetail.actorList,
                      recommendedContent: contentDetail.recommendedContent,
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
    required this.generalScore,
    required this.userScore,
    required this.scoreQuantity,
    Key? key,
  }) : super(key: key);

  final String coverImage;
  final double? generalScore;
  final double? userScore;
  final int? scoreQuantity;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: RemoteImage(
              imageUrl: coverImage,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: SizedBox(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Center(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              generalScore?.toString() ?? 'none',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Text(
                          userScore?.toString() ?? 'none',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Center(
                        child: Text(
                          scoreQuantity?.toString() ?? 'none',
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
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
    Key? key,
  }) : super(key: key);

  final String title;
  final String originalTitle;
  final String duration;
  final String description;
  final List<String> genres;
  final List<Actor> actorList;
  final List<RecommendedContent> recommendedContent;

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
                  Wrap(
                    children: [
                      const Text('2019'),
                      const Text('L'),
                      Text(
                        duration,
                      ),
                    ],
                  ),
                ],
              ),
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
