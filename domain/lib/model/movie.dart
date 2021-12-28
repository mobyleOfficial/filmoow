import 'package:domain/model/seen_status.dart';

class Movie {
  const Movie({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.status,
    this.score,
    this.commentsQuantity,

  });

  final String id;
  final String name;
  final String imageUrl;
  final SeenStatus status;
  final double? score;
  final int? commentsQuantity;
}
