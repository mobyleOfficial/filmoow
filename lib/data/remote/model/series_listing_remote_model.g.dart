// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesListingRemoteModel _$SeriesListingRemoteModelFromJson(
        Map<String, dynamic> json) =>
    SeriesListingRemoteModel(
      list: (json['seriesList'] as List<dynamic>)
          .map((e) => SeriesRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasNext: json['hasNext'] as bool,
    );

Map<String, dynamic> _$SeriesListingRemoteModelToJson(
        SeriesListingRemoteModel instance) =>
    <String, dynamic>{
      'seriesList': instance.list,
      'hasNext': instance.hasNext,
    };
