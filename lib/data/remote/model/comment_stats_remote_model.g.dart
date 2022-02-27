// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_stats_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentStatsRemoteModel _$CommentStatsRemoteModelFromJson(
        Map<String, dynamic> json) =>
    CommentStatsRemoteModel(
      rating: (json['rating'] as num?)?.toDouble(),
      likesQuantity: json['likesQuantity'] as int,
      repliesQuantity: json['repliesQuantity'] as int,
      hasDislikes: json['hasDislikes'] as bool,
      hasUserLike: json['hasUserLike'] as bool,
    );

Map<String, dynamic> _$CommentStatsRemoteModelToJson(
        CommentStatsRemoteModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'likesQuantity': instance.likesQuantity,
      'repliesQuantity': instance.repliesQuantity,
      'hasDislikes': instance.hasDislikes,
      'hasUserLike': instance.hasUserLike,
    };
