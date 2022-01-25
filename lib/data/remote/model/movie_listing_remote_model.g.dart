// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListingRemoteModel _$MovieListingRemoteModelFromJson(
    Map<String, dynamic> json) {
  return MovieListingRemoteModel(
    list: (json['movieList'] as List<dynamic>)
        .map((e) => MovieRemoteModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasNext: json['hasNext'] as bool,
  );
}

Map<String, dynamic> _$MovieListingRemoteModelToJson(
        MovieListingRemoteModel instance) =>
    <String, dynamic>{
      'movieList': instance.list,
      'hasNext': instance.hasNext,
    };
