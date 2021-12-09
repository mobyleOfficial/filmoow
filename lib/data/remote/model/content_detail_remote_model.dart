import 'package:filmoow/data/remote/model/actor_remote_model.dart';
import 'package:filmoow/data/remote/model/recommended_content_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_detail_remote_model.g.dart';

@JsonSerializable()
class ContentDetailRemoteModel {
  const ContentDetailRemoteModel({
    required this.title,
    required this.originalTitle,
    required this.description,
    required this.duration,
    required this.genres,
    required this.coverImages,
    required this.actors,
    required this.recommendedContent,
    this.generalScore,
    this.userScore,
    this.scoreQuantity,
    this.classification,
  });

  factory ContentDetailRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ContentDetailRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ContentDetailRemoteModelToJson(this);

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'originalTitle')
  final String originalTitle;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'generalScore')
  final double? generalScore;

  @JsonKey(name: 'userScore')
  final double? userScore;

  @JsonKey(name: 'scoreQuantity')
  final int? scoreQuantity;

  @JsonKey(name: 'movieClassification')
  final String? classification;

  @JsonKey(name: 'duration')
  final String duration;

  @JsonKey(name: 'genres')
  final List<String> genres;

  @JsonKey(name: 'coverImages')
  final List<String> coverImages;

  @JsonKey(name: 'actors')
  final List<ActorRemoteModel> actors;

  @JsonKey(name: 'recommendedContent')
  final List<RecommendedContentRemoteModel> recommendedContent;
}
