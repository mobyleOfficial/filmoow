import 'package:domain/model/actor.dart';
import 'package:domain/model/comment.dart';
import 'package:domain/model/comment_listing.dart';
import 'package:domain/model/comment_status.dart';
import 'package:domain/model/content_classification.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/content_list.dart';
import 'package:domain/model/content_list_stats.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/news.dart';
import 'package:domain/model/news_stats.dart';
import 'package:domain/model/recommended_content.dart';
import 'package:domain/model/seen_status.dart';
import 'package:domain/model/series.dart';
import 'package:domain/model/tv_show.dart';
import 'package:domain/model/user.dart';
import 'package:domain/model/user_information.dart';
import 'package:domain/model/watched_time.dart';
import 'package:filmoow/data/remote/model/actor_remote_model.dart';
import 'package:filmoow/data/remote/model/comment_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/comment_remote_model.dart';
import 'package:filmoow/data/remote/model/comment_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';
import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:filmoow/data/remote/model/content_list_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/news_remote_model.dart';
import 'package:filmoow/data/remote/model/news_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/recommended_content_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_remote_model.dart';
import 'package:filmoow/data/remote/model/user_information_remote_model.dart';
import 'package:filmoow/data/remote/model/user_remote_model.dart';

extension MovieDomainToRemoteMapper on MovieRemoteModel {
  Movie toDomain() => Movie(
        id: id,
        name: name,
        imageUrl: imageUrl,
        score: score,
        commentsQuantity: commentsQuantity,
        status: seenStatus?.toSeenStatusDomain() ?? SeenStatus.notSeen,
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
        releaseYear: releaseYear,
        seenStatus: seenStatus.toSeenStatusDomain(),
        movieClassification: classification.toMovieClassificationDomain(),
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

extension ContentClassificationToDomain on String? {
  ContentClassification toMovieClassificationDomain() {
    ContentClassification classification;

    switch (this) {
      case 'L - Livre para todos os públicos':
        classification = ContentClassification.L;
        break;
      case '10 - Não recomendado para menores de 10 anos':
        classification = ContentClassification.ten;
        break;
      case '12 - Não recomendado para menores de 12 anos':
        classification = ContentClassification.twelve;
        break;
      case '14 - Não recomendado para menores de 14 anos':
        classification = ContentClassification.fourteen;
        break;
      case '16 - Não recomendado para menores de 16 anos':
        classification = ContentClassification.sixteen;
        break;
      case '18 - Não recomendado para menores de 18 anos':
        classification = ContentClassification.eighteen;
        break;
      default:
        classification = ContentClassification.none;
        break;
    }
    return classification;
  }
}

extension SeenStatusToDomain on String {
  SeenStatus toSeenStatusDomain() {
    SeenStatus seenStatus;

    switch (this) {
      case 'WantToSee':
        seenStatus = SeenStatus.wantToSee;
        break;
      case 'Seen':
        seenStatus = SeenStatus.seen;
        break;
      case 'NotSeen':
        seenStatus = SeenStatus.notSeen;
        break;
      default:
        seenStatus = SeenStatus.none;
        break;
    }
    return seenStatus;
  }
}

extension TimeSpentToWatchedTime on String {
  WatchedTime toWatchedTime() {
    final splitDays = split('d');
    final days = splitDays[0];

    final splitHours = splitDays[1].split('h');
    final hours = splitHours[0];

    final splitMinutes = splitHours[1].split('min');
    final minutes = splitMinutes[0];

    return WatchedTime(
      days: days,
      hours: hours,
      minutes: minutes,
    );
  }
}

extension UserInformationRemoteToDomain on UserInformationRemoteModel {
  UserInformation toDomain() => UserInformation(
        name: name,
        userName: userName,
        imageUrl: imageUrl,
        watchedTime: timeSpent.toWatchedTime(),
        seenNumber: seenNumber,
        commentNumber: commentNumber,
        listNumber: listNumber,
      );
}

extension CommentListingRemoteToDomain on CommentListingRemoteModel {
  CommentListing toDomain() => CommentListing(
        hasNext: hasNext,
        commentList: commentList
            .map(
              (comment) => comment.toDomain(),
            )
            .toList(),
      );
}

extension CommentRemoteToDomain on CommentRemoteModel {
  Comment toDomain() => Comment(
        id: id,
        user: user.toDomain(),
        creationTime: creationTime,
        content: content,
        spoilerList: spoilerList,
        stats: stats.toDomain(),
      );
}

extension UserRemoteToDomain on UserRemoteModel {
  User toDomain() => User(
        id: id,
        name: name,
        photoUrl: photoUrl,
      );
}

extension CommentStatsRemoteToDomain on CommentStatsRemoteModel {
  CommentStats toDomain() => CommentStats(
        rating: rating,
        likesQuantity: likesQuantity,
        repliesQuantity: repliesQuantity,
        hasDislikes: hasDislikes,
        hasUserLike: hasUserLike,
      );
}
