import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/remote_image.dart';
import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isLast,
    this.commentsQuantity,
    this.score,
    Key? key,
  }) : super(key: key);

  final String id;
  final String name;
  final String imageUrl;
  final bool isLast;
  final int? commentsQuantity;
  final double? score;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushNamed(
          RouteNameBuilder.getContentDetailRoute(),
          arguments: id,
        ),
        child: Card(
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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RemoteImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
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
                ],
              ),
              Positioned(
                top: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (score != null)
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                          color: Colors.yellow.withOpacity(0.9),
                          child: Center(
                            child: Text(
                              score!.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
