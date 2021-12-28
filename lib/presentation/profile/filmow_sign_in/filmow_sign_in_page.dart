import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class FilmowSignInPage extends StatefulWidget {
  const FilmowSignInPage({
    required this.showLoading,
    required this.dismissLoading,
    Key? key,
  }) : super(key: key);

  final VoidCallback showLoading;
  final VoidCallback dismissLoading;

  @override
  State<StatefulWidget> createState() => FilmowSignInPageState();
}

class FilmowSignInPageState extends State<FilmowSignInPage> {
  late InAppWebViewController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        key: scaffoldKey,
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(
              'https://filmow.com/login/',
            ),
          ),
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onProgressChanged: (controller, progress) {
            final p = progress;
            final c = controller;

            if(p == 100) {
              widget.dismissLoading();
            } else {
              widget.showLoading();
            }
          },
          onLoadStop: (controller, url) async {
            if (url?.path.contains('/usuarios') ?? false) {
              // or using CookieManager
              CookieManager cookieManager = CookieManager.instance();
              Cookie? token = await cookieManager.getCookie(
                url: Uri.parse(
                  'https://filmow.com/',
                ),
                name: 'filmow_sessionid',
              );

              final myContext = scaffoldKey.currentContext;

              if (myContext != null) {
                Navigator.pop(myContext, token?.value ?? '');
              }
            }
          },
        ),
      );
}
