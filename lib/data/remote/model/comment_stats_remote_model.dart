import 'package:json_annotation/json_annotation.dart';

part 'comment_stats_remote_model.g.dart';

@JsonSerializable()
class CommentStatsRemoteModel {
  const CommentStatsRemoteModel({
    required this.rating,
    required this.likesQuantity,
    required this.repliesQuantity,
    required this.hasDislikes,
    required this.hasUserLike,
  });

  factory CommentStatsRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$CommentStatsRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$CommentStatsRemoteModelToJson(this);

  @JsonKey(name: 'rating')
  final double? rating;

  @JsonKey(name: 'likesQuantity')
  final int likesQuantity;

  @JsonKey(name: 'repliesQuantity')
  final int repliesQuantity;

  @JsonKey(name: 'hasDislikes')
  final bool hasDislikes;

  @JsonKey(name: 'hasUserLike')
  final bool hasUserLike;
}