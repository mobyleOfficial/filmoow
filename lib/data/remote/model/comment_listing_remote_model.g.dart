// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_listing_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentListingRemoteModel _$CommentListingRemoteModelFromJson(
        Map<String, dynamic> json) =>
    CommentListingRemoteModel(
      hasNext: json['hasNext'] as bool,
      commentList: (json['commentList'] as List<dynamic>)
          .map((e) => CommentRemoteModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentListingRemoteModelToJson(
        CommentListingRemoteModel instance) =>
    <String, dynamic>{
      'hasNext': instance.hasNext,
      'commentList': instance.commentList,
    };
