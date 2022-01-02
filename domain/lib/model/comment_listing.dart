import 'package:domain/model/comment.dart';

class CommentListing{
  const CommentListing({
    required this.hasNext,
    required this.commentList,
  });

  final bool hasNext;

  final List<Comment> commentList;
}
