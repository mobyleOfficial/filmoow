import 'package:json_annotation/json_annotation.dart';

part 'recommended_content_remote_model.g.dart';

@JsonSerializable()
class RecommendedContentRemoteModel {
  const RecommendedContentRemoteModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory RecommendedContentRemoteModel.fromJson(
          Map<String, dynamic> parsedJson) =>
      _$RecommendedContentRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() =>
      _$RecommendedContentRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'title')
  final String name;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;
}
