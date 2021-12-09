// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorRemoteModel _$ActorRemoteModelFromJson(Map<String, dynamic> json) {
  return ActorRemoteModel(
    id: json['id'] as String,
    name: json['name'] as String,
    photoUrl: json['photoUrl'] as String,
  );
}

Map<String, dynamic> _$ActorRemoteModelToJson(ActorRemoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
    };
