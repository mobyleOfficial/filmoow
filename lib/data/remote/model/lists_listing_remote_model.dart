import 'package:filmoow/data/remote/model/content_list_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_listing_remote_model.g.dart';

@JsonSerializable()
class ListsListingRemoteModel {
  const ListsListingRemoteModel({
    required this.hasNext,
    required this.lists,
  });

  factory ListsListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ListsListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ListsListingRemoteModelToJson(this);

  @JsonKey(name: 'hasNext')
  final bool hasNext;

  @JsonKey(name: 'lists')
  final List<ContentListRemoteModel> lists;
}
