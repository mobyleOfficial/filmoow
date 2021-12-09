// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_list_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentListRemoteModel _$ContentListRemoteModelFromJson(
    Map<String, dynamic> json) {
  return ContentListRemoteModel(
    id: json['id'] as String,
    name: json['name'] as String,
    stats: ContentListStatsRemoteModel.fromJson(
        json['stats'] as Map<String, dynamic>),
    imagesList:
        (json['imagesList'] as List<dynamic>).map((e) => e as String).toList(),
    description: json['description'] as String?,
    owner: json['owner'] as String?,
  );
}

Map<String, dynamic> _$ContentListRemoteModelToJson(
        ContentListRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'owner': instance.owner,
      'stats': instance.stats,
      'imagesList': instance.imagesList,
    };
