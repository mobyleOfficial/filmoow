import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RemoteImage extends StatelessWidget {
  const RemoteImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        width: width ?? 200,
        height: height,
        fit: fit ?? BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (_, __, ___) => const Icon(
          Icons.error,
        ),
      );
}
