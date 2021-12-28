import 'package:json_annotation/json_annotation.dart';

part 'user_information_remote_model.g.dart';

@JsonSerializable()
class UserInformationRemoteModel {
  const UserInformationRemoteModel({
    required this.name,
    required this.userName,
    required this.imageUrl,
    required this.timeSpent,
    required this.seenNumber,
    required this.commentNumber,
    required this.listNumber,
  });

  factory UserInformationRemoteModel.fromJson(
          Map<String, dynamic> parsedJson) =>
      _$UserInformationRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$UserInformationRemoteModelToJson(this);

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'userName')
  final String userName;

  @JsonKey(name: 'imageUrl')
  final String imageUrl;

  @JsonKey(name: 'timeSpent')
  final String timeSpent;

  @JsonKey(name: 'seenNumber')
  final int seenNumber;

  @JsonKey(name: 'commentNumber')
  final int commentNumber;

  @JsonKey(name: 'listNumber')
  final int listNumber;
}
