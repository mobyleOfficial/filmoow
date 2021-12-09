import 'package:json_annotation/json_annotation.dart';

part 'content_list_stats_remote_model.g.dart';

@JsonSerializable()
class ContentListStatsRemoteModel {
  const ContentListStatsRemoteModel({
    required this.listSize,
    required this.likesQuantity,
    required this.commentsQuantity,
  });

  factory ContentListStatsRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$ContentListStatsRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$ContentListStatsRemoteModelToJson(this);

  @JsonKey(name: 'listSize')
  final int listSize;
  @JsonKey(name: 'likesQuantity')
  final int likesQuantity;
  @JsonKey(name: 'commentsQuantity')
  final int commentsQuantity;
}
