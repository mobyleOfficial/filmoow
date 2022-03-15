import 'package:json_annotation/json_annotation.dart';

part 'content_remote_model.g.dart';

@JsonSerializable()
class ContentRemoteModel {
  const ContentRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.score,
    this.commentsQuantity,
    this.seenStatus,
  });

  factory ContentRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ContentRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ContentRemoteModelToJson(this);

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

  @JsonKey(name: 'seenStatus')
  final String? seenStatus;
}
