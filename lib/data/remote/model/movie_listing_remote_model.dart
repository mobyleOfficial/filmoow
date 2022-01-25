import 'package:filmoow/data/remote/model/movie_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_listing_remote_model.g.dart';

@JsonSerializable()
class MovieListingRemoteModel {
  const MovieListingRemoteModel({
    required this.list,
    required this.hasNext,
  });

  factory MovieListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$MovieListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$MovieListingRemoteModelToJson(this);

  @JsonKey(name: 'movieList')
  final List<MovieRemoteModel> list;

  @JsonKey(name: 'hasNext')
  final bool hasNext;
}
