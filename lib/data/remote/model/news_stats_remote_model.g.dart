// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_stats_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsStatsRemoteModel _$NewsStatsRemoteModelFromJson(
        Map<String, dynamic> json) =>
    NewsStatsRemoteModel(
      likesQuantity: json['likesQuantity'] as int,
      commentsQuantity: json['commentsQuantity'] as int,
    );

Map<String, dynamic> _$NewsStatsRemoteModelToJson(
        NewsStatsRemoteModel instance) =>
    <String, dynamic>{
      'likesQuantity': instance.likesQuantity,
      'commentsQuantity': instance.commentsQuantity,
    };
