// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShowListingRemoteModel _$TvShowListingRemoteModelFromJson(
        Map<String, dynamic> json) =>
    TvShowListingRemoteModel(
      list: (json['tvShowList'] as List<dynamic>)
          .map((e) => TvShowRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$TvShowListingRemoteModelToJson(
        TvShowListingRemoteModel instance) =>
    <String, dynamic>{
      'tvShowList': instance.list,
      'hasNext': instance.hasNext,
    };
