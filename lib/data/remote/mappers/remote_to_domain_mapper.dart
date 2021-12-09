import 'package:domain/model/actor.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/content_list.dart';
import 'package:domain/model/content_list_stats.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/news_stats.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:domain/model/recommended_content.dart';
import 'package:filmoow/data/remote/model/actor_remote_model.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';
import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/content_list_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/news_remote_model.dart';
import 'package:filmoow/data/remote/model/news_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/recommended_content_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_remote_model.dart';

extension MovieDomainToRemoteMapper on MovieRemoteModel {
  Movie toDomain() => Movie(
        id: id,
        name: name,
        imageUrl: imageUrl,
        score: score,
        commentsQuantity: commentsQuantity,
      );
}

extension SeriesDomainToRemoteMapper on SeriesRemoteModel {
  Series toDomain() => Series(
        id: id,
        name: name,
        imageUrl: imageUrl,
        score: score,
      );
}

extension NewsDomainToRemoteMapper on NewsRemoteModel {
  News toDomain() => News(
        id: id,
        title: title,
        coverImage: coverImage,
        creation: creation,
        stats: stats.toDomain(),
      );
}

extension NewsStatsDomainToRemoteMapper on NewsStatsRemoteModel {
  NewsStats toDomain() => NewsStats(
        likesQuantity: likesQuantity,
        commentsQuantity: commentsQuantity,
      );
}

extension TvShowDomainToRemoteMapper on TvShowRemoteModel {
  TvShow toDomain() => TvShow(
        id: id,
        name: name,
        imageUrl: imageUrl,
        score: score,
        commentsQuantity: commentsQuantity,
      );
}

extension ContentListDomainToRemoteMapper on ContentListRemoteModel {
  ContentList toDomain() => ContentList(
        id: id,
        name: name,
        description: description,
        owner: owner,
        stats: stats.toDomain(),
        imagesList: imagesList,
      );
}

extension ContentListStatsDomainToRemoteMapper on ContentListStatsRemoteModel {
  ContentListStats toDomain() => ContentListStats(
        likesQuantity: likesQuantity,
        listSize: listSize,
        commentsQuantity: commentsQuantity,
      );
}

extension ContentDetailToDomain on ContentDetailRemoteModel {
  ContentDetail toDomain() => ContentDetail(
        title: title,
        originalTitle: originalTitle,
        description: description,
        duration: duration,
        genres: genres,
        coverImages: coverImages,
        generalScore: generalScore,
        userScore: userScore,
        scoreQuantity: scoreQuantity,
        movieClassification: classification,
        actorList: actors
            .map(
              (actor) => actor.toDomain(),
            )
            .toList(),
        recommendedContent: recommendedContent
            .map(
              (recommendedContent) => RecommendedContent(
                imageUrl: recommendedContent.imageUrl,
                id: recommendedContent.id,
                name: recommendedContent.name,
              ),
            )
            .toList(),
      );
}

extension ActorToDomain on ActorRemoteModel {
  Actor toDomain() => Actor(
        id: id,
        name: name,
        photoUrl: photoUrl,
      );
}

extension RecommendedContentToDomain on RecommendedContentRemoteModel {
  RecommendedContent toDomain() => RecommendedContent(
        id: id,
        name: name,
        imageUrl: imageUrl,
      );
}
