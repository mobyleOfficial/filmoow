import 'package:domain/model/comment_listing.dart';
import 'package:domain/model/content_detail.dart';
import 'package:domain/model/seen_status.dart';

abstract class ContentRepository {
  Future<ContentDetail> getContentDetail(String id);

  Future<SeenStatus> changeSeenStatus(String id, SeenStatus seenStatus);

  Future<CommentListing> getCommentList(int page, String id);

  Future<void> addComment(String id, String comment);
}