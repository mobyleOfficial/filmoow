class Series {
  const Series({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.score,
    this.commentsQuantity,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double? score;
  final int? commentsQuantity;
}
