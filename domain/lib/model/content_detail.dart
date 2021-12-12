import 'package:domain/model/actor.dart';
import 'package:domain/model/content_classification.dart';
import 'package:domain/model/recommended_content.dart';
import 'package:domain/model/seen_status.dart';

class ContentDetail {
  const ContentDetail({
    required this.title,
    required this.originalTitle,
    required this.description,
    required this.duration,
    required this.genres,
    required this.coverImages,
    required this.actorList,
    required this.recommendedContent,
    required this.movieClassification,
    required this.releaseYear,
    required this.seenStatus,
    this.generalScore,
    this.userScore,
    this.scoreQuantity,
  });

  final String title;

  final String originalTitle;

  final String description;

  final double? generalScore;

  final double? userScore;

  final int? scoreQuantity;

  final ContentClassification movieClassification;

  final String duration;

  final int releaseYear;

  final SeenStatus seenStatus;

  final List<String> genres;

  final List<String> coverImages;

  final List<Actor> actorList;

  final List<RecommendedContent> recommendedContent;
}
