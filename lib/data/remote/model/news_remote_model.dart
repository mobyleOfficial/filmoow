import 'package:filmoow/data/remote/model/news_stats_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_remote_model.g.dart';

@JsonSerializable()
class NewsRemoteModel {
  const NewsRemoteModel({
    required this.id,
    required this.title,
    required this.creation,
    required this.coverImage,
    required this.stats,
  });

  factory NewsRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$NewsRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$NewsRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'creation')
  final String creation;
  @JsonKey(name: 'coverImage')
  final String coverImage;
  @JsonKey(name: 'stats')
  final NewsStatsRemoteModel stats;
}
