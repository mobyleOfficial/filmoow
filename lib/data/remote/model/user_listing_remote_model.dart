import 'package:filmoow/data/remote/model/user_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_listing_remote_model.g.dart';

@JsonSerializable()
class UserListingRemoteModel {
  const UserListingRemoteModel({
    required this.hasNext,
    required this.userList,
  });

  factory UserListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$UserListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$UserListingRemoteModelToJson(this);

  @JsonKey(name: 'hasNext')
  final bool hasNext;

  @JsonKey(name: 'userList')
  final List<UserRemoteModel> userList;
}