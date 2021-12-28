// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformationRemoteModel _$UserInformationRemoteModelFromJson(
    Map<String, dynamic> json) {
  return UserInformationRemoteModel(
    name: json['name'] as String,
    userName: json['userName'] as String,
    imageUrl: json['imageUrl'] as String,
    timeSpent: json['timeSpent'] as String,
    seenNumber: json['seenNumber'] as int,
    commentNumber: json['commentNumber'] as int,
    listNumber: json['listNumber'] as int,
  );
}

Map<String, dynamic> _$UserInformationRemoteModelToJson(
        UserInformationRemoteModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userName': instance.userName,
      'imageUrl': instance.imageUrl,
      'timeSpent': instance.timeSpent,
      'seenNumber': instance.seenNumber,
      'commentNumber': instance.commentNumber,
      'listNumber': instance.listNumber,
    };
