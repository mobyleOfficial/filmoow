import 'package:domain/model/comment.dart';
import 'package:domain/model/content_detail.dart';

abstract class ContentDetailState {}

class Loading extends ContentDetailState {}

class Success extends ContentDetailState {
  Success({
    required this.contentDetail,
    required this.commentList,
  });

  final ContentDetail contentDetail;
  final List<Comment> commentList;
}

class Error extends ContentDetailState {}
