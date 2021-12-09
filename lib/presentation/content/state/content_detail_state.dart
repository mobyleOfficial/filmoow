import 'package:domain/model/content_detail.dart';

abstract class ContentDetailState {}

class Loading extends ContentDetailState {}

class Success extends ContentDetailState {
  Success({
    required this.contentDetail,
  });

  final ContentDetail contentDetail;
}

class Error extends ContentDetailState {}
