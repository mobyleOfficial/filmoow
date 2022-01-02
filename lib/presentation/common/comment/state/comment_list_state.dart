import 'package:domain/model/comment.dart';

abstract class CommentListState {}

class CommentListingState implements CommentListState {
  const CommentListingState({
    this.commentList,
    this.nextOffset,
    this.error,
  });

  final List<Comment>? commentList;
  final int? nextOffset;
  final CommentListingError? error;
}

class CommentListingError implements CommentListState {}

class Loading implements CommentListState {}