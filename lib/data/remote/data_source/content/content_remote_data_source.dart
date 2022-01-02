import 'package:filmoow/data/remote/model/comment_listing_remote_model.dart';
import 'package:filmoow/data/remote/model/content_detail_remote_model.dart';

abstract class ContentRemoteDataSource {
  Future<ContentDetailRemoteModel> getContentDetail(String id);

  Future<String> changeSeenStatus(
    String id,
    String status,
  );

  Future<CommentListingRemoteModel> getCommentList(int page, String id);
}
