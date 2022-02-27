// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_list_stats_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentListStatsRemoteModel _$ContentListStatsRemoteModelFromJson(
        Map<String, dynamic> json) =>
    ContentListStatsRemoteModel(
      listSize: json['listSize'] as int,
      likesQuantity: json['likesQuantity'] as int,
      commentsQuantity: json['commentsQuantity'] as int,
    );

Map<String, dynamic> _$ContentListStatsRemoteModelToJson(
        ContentListStatsRemoteModel instance) =>
    <String, dynamic>{
      'listSize': instance.listSize,
      'likesQuantity': instance.likesQuantity,
      'commentsQuantity': instance.commentsQuantity,
    };
