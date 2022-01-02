import 'package:json_annotation/json_annotation.dart';

part 'user_remote_model.g.dart';

@JsonSerializable()
class UserRemoteModel {
  const UserRemoteModel({
    required this.id,
    required this.name,
    required this.photoUrl,
  });

  factory UserRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$UserRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$UserRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'photoUrl')
  final String photoUrl;
}
