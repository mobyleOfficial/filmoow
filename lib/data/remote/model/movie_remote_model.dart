import 'package:filmoow/data/remote/model/content_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_remote_model.g.dart';

@JsonSerializable()
class MovieRemoteModel extends ContentRemoteModel {
  MovieRemoteModel({
    required String id,
    required String name,
    required String imageUrl,
    double? score,
    int? commentsQuantity,
    String? status,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          score: score,
          commentsQuantity: commentsQuantity,
          seenStatus: status,
        );

  factory MovieRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$MovieRemoteModelFromJson(parsedJson);

  @override
  Map<String, dynamic> toJson() => _$MovieRemoteModelToJson(this);
}
