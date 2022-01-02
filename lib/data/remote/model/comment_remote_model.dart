import 'package:filmoow/data/remote/model/comment_stats_remote_model.dart';
import 'package:filmoow/data/remote/model/user_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_remote_model.g.dart';

@JsonSerializable()
class CommentRemoteModel {
  const CommentRemoteModel({
    required this.id,
    required this.user,
    required this.creationTime,
    required this.content,
    required this.spoilerList,
    required this.stats,
  });

  factory CommentRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$CommentRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$CommentRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'owner')
  final UserRemoteModel user;

  @JsonKey(name: 'creationTime')
  final String creationTime;

  @JsonKey(name: 'comment')
  final String content;

  @JsonKey(name: 'spoilerList')
  final List<String> spoilerList;

  @JsonKey(name: 'stats')
  final CommentStatsRemoteModel stats;
}