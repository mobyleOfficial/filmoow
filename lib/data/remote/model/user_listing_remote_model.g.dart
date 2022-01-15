// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserListingRemoteModel _$UserListingRemoteModelFromJson(
    Map<String, dynamic> json) {
  return UserListingRemoteModel(
    hasNext: json['hasNext'] as bool,
    userList: (json['userList'] as List<dynamic>)
        .map((e) => UserRemoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserListingRemoteModelToJson(
        UserListingRemoteModel instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'userList': instance.userList,
    };
