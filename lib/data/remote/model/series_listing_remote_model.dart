import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_listing_remote_model.g.dart';

@JsonSerializable()
class SeriesListingRemoteModel {
  const SeriesListingRemoteModel({
    required this.list,
    required this.hasNext,
  });

  factory SeriesListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$SeriesListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$SeriesListingRemoteModelToJson(this);

  @JsonKey(name: 'seriesList')
  final List<SeriesRemoteModel> list;

  @JsonKey(name: 'hasNext')
  final bool hasNext;
}
