import 'package:json_annotation/json_annotation.dart';

part 'actor_remote_model.g.dart';

@JsonSerializable()
class ActorRemoteModel {
  const ActorRemoteModel({
    required this.id,
    required this.name,
    required this.photoUrl,
  });

  factory ActorRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ActorRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ActorRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'photoUrl')
  final String photoUrl;
}
