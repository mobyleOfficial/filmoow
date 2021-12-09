import 'package:filmoow/data/remote/model/content_list_stats_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_list_remote_model.g.dart';

@JsonSerializable()
class ContentListRemoteModel {
  const ContentListRemoteModel({
    required this.id,
    required this.name,
    required this.stats,
    required this.imagesList,
    this.description,
    this.owner,
  });

  factory ContentListRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ContentListRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ContentListRemoteModelToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'owner')
  final String? owner;
  @JsonKey(name: 'stats')
  final ContentListStatsRemoteModel stats;
  @JsonKey(name: 'imagesList')
  final List<String> imagesList;
}
