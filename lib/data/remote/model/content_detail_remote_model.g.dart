// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_detail_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentDetailRemoteModel _$ContentDetailRemoteModelFromJson(
    Map<String, dynamic> json) {
  return ContentDetailRemoteModel(
    title: json['title'] as String,
    originalTitle: json['originalTitle'] as String,
    description: json['description'] as String,
    duration: json['duration'] as String,
    genres: (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    coverImages:
        (json['coverImages'] as List<dynamic>).map((e) => e as String).toList(),
    actors: (json['actors'] as List<dynamic>)
        .map((e) => ActorRemoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendedContent: (json['recommendedContent'] as List<dynamic>)
        .map((e) =>
            RecommendedContentRemoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    generalScore: (json['generalScore'] as num?)?.toDouble(),
    userScore: (json['userScore'] as num?)?.toDouble(),
    scoreQuantity: json['scoreQuantity'] as int?,
    classification: json['movieClassification'] as String?,
  );
}

Map<String, dynamic> _$ContentDetailRemoteModelToJson(
        ContentDetailRemoteModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'description': instance.description,
      'generalScore': instance.generalScore,
      'userScore': instance.userScore,
      'scoreQuantity': instance.scoreQuantity,
      'movieClassification': instance.classification,
      'duration': instance.duration,
      'genres': instance.genres,
      'coverImages': instance.coverImages,
      'actors': instance.actors,
      'recommendedContent': instance.recommendedContent,
    };
