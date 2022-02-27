// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesRemoteModel _$SeriesRemoteModelFromJson(Map<String, dynamic> json) =>
    SeriesRemoteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      score: (json['score'] as num?)?.toDouble(),
      commentsQuantity: json['commentsQuantity'] as int?,
    );

Map<String, dynamic> _$SeriesRemoteModelToJson(SeriesRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.imageUrl,
      'score': instance.score,
      'commentsQuantity': instance.commentsQuantity,
    };
