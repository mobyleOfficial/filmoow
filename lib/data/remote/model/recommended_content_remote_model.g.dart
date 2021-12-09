// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_content_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedContentRemoteModel _$RecommendedContentRemoteModelFromJson(
    Map<String, dynamic> json) {
  return RecommendedContentRemoteModel(
    id: json['id'] as String,
    name: json['title'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$RecommendedContentRemoteModelToJson(
        RecommendedContentRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'imageUrl': instance.imageUrl,
    };
