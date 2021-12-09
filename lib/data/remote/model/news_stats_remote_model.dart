import 'package:json_annotation/json_annotation.dart';

part 'news_stats_remote_model.g.dart';

@JsonSerializable()
class NewsStatsRemoteModel {
  const NewsStatsRemoteModel({
    required this.likesQuantity,
    required this.commentsQuantity,
  });

  factory NewsStatsRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$NewsStatsRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$NewsStatsRemoteModelToJson(this);

  @JsonKey(name: 'likesQuantity')
  final int likesQuantity;
  @JsonKey(name: 'commentsQuantity')
  final int commentsQuantity;
}
