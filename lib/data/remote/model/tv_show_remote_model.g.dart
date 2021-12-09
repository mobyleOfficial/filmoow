// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowRemoteModel _$TvShowRemoteModelFromJson(Map<String, dynamic> json) {
  return TvShowRemoteModel(
    id: json['id'] as String,
    name: json['name'] as String,
    imageUrl: json['image'] as String,
    score: (json['score'] as num?)?.toDouble(),
    commentsQuantity: json['commentsQuantity'] as int?,
  );
}

Map<String, dynamic> _$TvShowRemoteModelToJson(TvShowRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.imageUrl,
      'score': instance.score,
      'commentsQuantity': instance.commentsQuantity,
    };
