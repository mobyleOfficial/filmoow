import 'package:domain/model/content.dart';
import 'package:domain/model/seen_status.dart';

class TvShow extends Content {
  TvShow({
    required String id,
    required String name,
    required String imageUrl,
    required SeenStatus status,
    int? commentsQuantity,
    double? score,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          status: status,
          score: score,
          commentsQuantity: commentsQuantity,
        );
}
