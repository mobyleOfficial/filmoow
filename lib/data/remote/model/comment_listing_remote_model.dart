import 'package:filmoow/data/remote/model/comment_remote_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_listing_remote_model.g.dart';

@JsonSerializable()
class CommentListingRemoteModel {
  const CommentListingRemoteModel({
    required this.hasNext,
    required this.commentList,
  });

  factory CommentListingRemoteModel.fromJson(Map<String, dynamic> parsedJson) =>
      _$CommentListingRemoteModelFromJson(parsedJson);

  Map<String, dynamic> toJson() => _$CommentListingRemoteModelToJson(this);

  @JsonKey(name: 'hasNext')
  final bool hasNext;

  @JsonKey(name: 'commentList')
  final List<CommentRemoteModel> commentList;
}
