import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:filmoow/data/remote/model/series_remote_model.dart';
import 'package:filmoow/data/remote/model/tv_show_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_show_listing_remote_model.g.dart';

@JsonSerializable()
class TvShowListingRemoteModel {
  const TvShowListingRemoteModel({
    required this.list,
    required this.hasNext,
  });

  factory TvShowListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$TvShowListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$TvShowListingRemoteModelToJson(this);

  @JsonKey(name: 'tvShowList')
  final List<TvShowRemoteModel> list;

  @JsonKey(name: 'hasNext')
  final bool hasNext;
}