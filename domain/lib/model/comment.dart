import 'package:domain/model/comment_status.dart';
import 'package:domain/model/user.dart';

class Comment {
  const Comment({
    required this.id,
    required this.user,
    required this.creationTime,
    required this.content,
    required this.spoilerList,
    required this.stats,
  });

  final String id;

  final User user;

  final String creationTime;

  final String content;

  final List<String> spoilerList;

  final CommentStats stats;
}
