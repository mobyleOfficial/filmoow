import 'package:domain/model/comment.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:filmoow/presentation/common/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    required this.comment,
    Key? key,
  }) : super(key: key);
  final Comment comment;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: Sizes.dp40,
                    height: Sizes.dp40,
                    margin: const EdgeInsets.symmetric(
                      horizontal: Sizes.dp8,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          comment.user.photoUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            '${comment.user.name} - ',
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            comment.creationTime,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.dp4,
                      ),
                      ExpandableText(
                        comment.content,
                        style: const TextStyle(
                          color: Colors.black87,
                        ),
                        expandText: 'Mostrar mais',
                        maxLines: 3,
                        linkColor: Colors.blue,
                      ),
                      const SizedBox(
                        height: Sizes.dp12,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.thumbsUp,
                                size: Sizes.dp16,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: Sizes.dp4,
                              ),
                              Text(
                                comment.stats.likesQuantity.toString(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: Sizes.dp12,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.thumbsDown,
                            size: Sizes.dp16,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.dp12,
                      ),
                      if (comment.stats.repliesQuantity > 0)
                        Text(
                          '${comment.stats.repliesQuantity} '
                          'Respostas',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      );
}
