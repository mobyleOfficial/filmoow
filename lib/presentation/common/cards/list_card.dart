import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListsCard extends StatelessWidget {
  const ListsCard({
    required this.name,
    required this.imageList,
    required this.isLast,
    required this.listSize,
    required this.likes,
    required this.comments,
    required this.creation,
    Key? key,
  }) : super(key: key);

  final String name;
  final List<String> imageList;
  final bool isLast;
  final int listSize;
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
          Stack(
            children: [
              ...imageList
                  .asMap()
                  .entries
                  .map(
                    (element) => CachedNetworkImage(
                      width: cardWidth - (element.key * 40),
                      height: 300,
                      fit: BoxFit.fill,
                      imageUrl: element.value,
                      placeholder: (_, __) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (_, __, ___) => const Icon(
                        Icons.error,
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: cardWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: cardWidth,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.list,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            listSize.toString(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
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
                      const SizedBox(
                        width: 10,
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
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
