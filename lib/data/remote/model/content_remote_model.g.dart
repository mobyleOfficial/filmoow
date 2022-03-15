// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentRemoteModel _$ContentRemoteModelFromJson(Map<String, dynamic> json) =>
    ContentRemoteModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image'] as String,
      score: (json['score'] as num?)?.toDouble(),
      commentsQuantity: json['commentsQuantity'] as int?,
      seenStatus: json['seenStatus'] as String?,
    );

Map<String, dynamic> _$ContentRemoteModelToJson(ContentRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.imageUrl,
      'score': instance.score,
      'commentsQuantity': instance.commentsQuantity,
      'seenStatus': instance.seenStatus,
    };
