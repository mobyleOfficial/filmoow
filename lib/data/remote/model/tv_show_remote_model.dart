import 'package:json_annotation/json_annotation.dart';

part 'tv_show_remote_model.g.dart';

@JsonSerializable()
class TvShowRemoteModel {
  const TvShowRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.score,
    this.commentsQuantity,
  });

  factory TvShowRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$TvShowRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$TvShowRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image')
  final String imageUrl;

  @JsonKey(name: 'score')
  final double? score;

  @JsonKey(name: 'commentsQuantity')
  final int? commentsQuantity;
}
