// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsRemoteModel _$NewsRemoteModelFromJson(Map<String, dynamic> json) =>
    NewsRemoteModel(
      id: json['id'] as String,
      title: json['title'] as String,
      creation: json['creation'] as String,
      coverImage: json['coverImage'] as String,
      stats:
          NewsStatsRemoteModel.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsRemoteModelToJson(NewsRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'creation': instance.creation,
      'coverImage': instance.coverImage,
      'stats': instance.stats,
    };
