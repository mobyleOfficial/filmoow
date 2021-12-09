import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.name,
    required this.imageUrl,
    required this.isLast,
    required this.likes,
    required this.comments,
    required this.creation,
    Key? key,
  }) : super(key: key);

  final String name;
  final String imageUrl;
  final bool isLast;
  final int likes;
  final int comments;
  final String creation;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.of(context).size.width - 50;

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      margin: EdgeInsets.only(
        left: 20,
        right: isLast ? 20 : 0,
        bottom: 20,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RemoteImage(
            width: cardWidth,
            fit: BoxFit.cover,
            imageUrl: imageUrl,
          ),
          SizedBox(
            width: cardWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            children: [
              SizedBox(
                width: cardWidth / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.thumbsUp,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          likes.toString(),
                        ),
                      ],
                    ),
                    const FaIcon(
                      FontAwesomeIcons.thumbsDown,
                    ),
                    Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.comments,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          comments.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.clock,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    creation,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
