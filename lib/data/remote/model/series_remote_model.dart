import 'package:json_annotation/json_annotation.dart';

part 'series_remote_model.g.dart';

@JsonSerializable()
class SeriesRemoteModel {
  const SeriesRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.score,
    this.commentsQuantity,
  });

  factory SeriesRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$SeriesRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$SeriesRemoteModelToJson(this);

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
