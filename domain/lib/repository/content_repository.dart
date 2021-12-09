import 'package:domain/model/content_detail.dart';

abstract class ContentRepository {
  Future<ContentDetail> getContentDetail(String id);
}