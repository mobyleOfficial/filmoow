class CommentStats {
  const CommentStats({
    required this.rating,
    required this.likesQuantity,
    required this.repliesQuantity,
    required this.hasDislikes,
    required this.hasUserLike,
  });

  final double? rating;
  final int likesQuantity;
  final int repliesQuantity;
  final bool hasDislikes;
  final bool hasUserLike;
}
