// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRemoteModel _$CommentRemoteModelFromJson(Map<String, dynamic> json) {
  return CommentRemoteModel(
    id: json['id'] as String,
    user: UserRemoteModel.fromJson(json['owner'] as Map<String, dynamic>),
    creationTime: json['creationTime'] as String,
    content: json['comment'] as String,
    spoilerList:
        (json['spoilerList'] as List<dynamic>).map((e) => e as String).toList(),
    stats:
        CommentStatsRemoteModel.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentRemoteModelToJson(CommentRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.user,
      'creationTime': instance.creationTime,
      'comment': instance.content,
      'spoilerList': instance.spoilerList,
      'stats': instance.stats,
    };
