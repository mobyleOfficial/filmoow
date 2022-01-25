import 'package:filmoow/presentation/content/content_page.dart';
import 'package:flutter/material.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    Key? key,
  }) : super(key: key);

  static Widget create() => const ContentContainer();

  @override
  Widget build(BuildContext context) => ContentPage();
}
