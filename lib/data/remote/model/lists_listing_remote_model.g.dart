// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListsListingRemoteModel _$ListsListingRemoteModelFromJson(
        Map<String, dynamic> json) =>
    ListsListingRemoteModel(
      hasNext: json['hasNext'] as bool,
      lists: (json['lists'] as List<dynamic>)
          .map(
              (e) => ContentListRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListsListingRemoteModelToJson(
        ListsListingRemoteModel instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'lists': instance.lists,
    };
