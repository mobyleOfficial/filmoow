import 'package:domain/model/actor.dart';
import 'package:domain/model/recommended_content.dart';

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
    this.generalScore,
    this.userScore,
    this.scoreQuantity,
    this.movieClassification,
  });

  final String title;

  final String originalTitle;

  final String description;

  final double? generalScore;

  final double? userScore;

  final int? scoreQuantity;

  final String? movieClassification;

  final String duration;

  final List<String> genres;

  final List<String> coverImages;

  final List<Actor> actorList;

  final List<RecommendedContent> recommendedContent;
}
