import 'package:domain/model/content_list.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:filmoow/presentation/common/cards/content_card.dart';
import 'package:filmoow/presentation/common/cards/list_card.dart';
import 'package:filmoow/presentation/common/cards/news_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.popularMovieList,
    required this.popularTvShowList,
    required this.popularSeriesList,
    required this.contentListList,
    required this.latestNewsList,
    required this.weekPremiereMovieList,
    required this.comingSoonMovieList,
    required this.availableMovieList,
    Key? key,
  }) : super(key: key);

  final List<Movie> popularMovieList;
  final List<TvShow> popularTvShowList;
  final List<Series> popularSeriesList;
  final List<ContentList> contentListList;
  final List<News> latestNewsList;
  final List<Movie> weekPremiereMovieList;
  final List<Movie> comingSoonMovieList;
  final List<Movie> availableMovieList;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('Filnow'),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _ContentFrame(
                  title: 'Filmes populares',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularMovieList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: popularMovieList[index].id,
                        imageUrl: popularMovieList[index].imageUrl,
                        name: popularMovieList[index].name,
                        isLast: index == popularMovieList.length - 1,
                        score: popularMovieList[index].score,
                        commentsQuantity:
                            popularMovieList[index].commentsQuantity,
                        seenStatus: popularMovieList[index].status,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Séries populares',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularSeriesList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: popularSeriesList[index].id,
                        imageUrl: popularSeriesList[index].imageUrl,
                        name: popularSeriesList[index].name,
                        isLast: index == popularSeriesList.length - 1,
                        score: popularSeriesList[index].score,
                        commentsQuantity:
                            popularSeriesList[index].commentsQuantity,
                        seenStatus: SeenStatus.notSeen,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Últimas noticias',
                  child: SizedBox(
                    height: 280,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: latestNewsList.length,
                      itemBuilder: (_, index) => NewsCard(
                        imageUrl: latestNewsList[index].coverImage,
                        name: latestNewsList[index].title,
                        isLast: index == latestNewsList.length - 1,
                        likes: latestNewsList[index].stats.likesQuantity,
                        comments: latestNewsList[index].stats.commentsQuantity,
                        creation: latestNewsList[index].creation,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Estreias da semana',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: weekPremiereMovieList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: weekPremiereMovieList[index].id,
                        imageUrl: weekPremiereMovieList[index].imageUrl,
                        name: weekPremiereMovieList[index].name,
                        isLast: index == weekPremiereMovieList.length - 1,
                        score: weekPremiereMovieList[index].score,
                        commentsQuantity:
                            weekPremiereMovieList[index].commentsQuantity,
                        seenStatus: weekPremiereMovieList[index].status,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Em breve',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: comingSoonMovieList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: comingSoonMovieList[index].id,
                        imageUrl: comingSoonMovieList[index].imageUrl,
                        name: comingSoonMovieList[index].name,
                        isLast: index == comingSoonMovieList.length - 1,
                        score: comingSoonMovieList[index].score,
                        commentsQuantity:
                            comingSoonMovieList[index].commentsQuantity,
                        seenStatus: comingSoonMovieList[index].status,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Listas populares da semana',
                  child: SizedBox(
                    height: 430,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: contentListList.length,
                      itemBuilder: (_, index) => ListsCard(
                        imageList: contentListList[index].imagesList,
                        name: contentListList[index].name,
                        isLast: index == contentListList.length - 1,
                        listSize: contentListList[index].stats.listSize,
                        likes: contentListList[index].stats.likesQuantity,
                        comments: contentListList[index].stats.commentsQuantity,
                        creation: '',
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Em cartaz',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: availableMovieList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: availableMovieList[index].id,
                        imageUrl: availableMovieList[index].imageUrl,
                        name: availableMovieList[index].name,
                        isLast: index == availableMovieList.length - 1,
                        score: availableMovieList[index].score,
                        commentsQuantity:
                            availableMovieList[index].commentsQuantity,
                        seenStatus: availableMovieList[index].status,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                _ContentFrame(
                  title: 'Shows de TV',
                  child: SizedBox(
                    height: 390,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularTvShowList.length,
                      itemBuilder: (_, index) => ContentCard(
                        id: popularTvShowList[index].id,
                        imageUrl: popularTvShowList[index].imageUrl,
                        name: popularTvShowList[index].name,
                        isLast: index == popularTvShowList.length - 1,
                        score: popularTvShowList[index].score,
                        commentsQuantity:
                            popularTvShowList[index].commentsQuantity,
                        seenStatus: SeenStatus.notSeen,
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
}

class _ContentFrame extends StatelessWidget {
  const _ContentFrame({
    required this.title,
    required this.child,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 8,
                bottom: 16,
              ),
              child: InkWell(
                onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const FaIcon(
                      FontAwesomeIcons.chevronRight,
                    ),
                  ],
                ),
              ),
            ),
            child,
          ],
        ),
      );
}
