import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeamlessWebView extends StatefulWidget {
  final String content;

  SeamlessWebView(this.content);

  @override
  _SeamlessWebViewState createState() => _SeamlessWebViewState();
}

class _SeamlessWebViewState extends State<SeamlessWebView> {
  double _height = 100;
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      child: WebView(
        initialUrl: "https://shubhamschahar.com",
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (url) async {
          double height = double.parse(await _controller
              .evaluateJavascript("document.documentElement.scrollHeight;"));
          setState(() {
            _height = height;
          });
        },
        onWebViewCreated: (WebViewController controller) async {
          _controller = controller;
          await controller.loadUrl(Uri.dataFromString(
                  _getHTMLPageFromString(widget.content),
                  mimeType: 'text/html',
                  encoding: Encoding.getByName('utf-8'))
              .toString());
        },
      ),
    );
  }
}

_getHTMLPageFromString(String content) {
  return '<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>Forum</title> </head> <body> $content <style> html, body { margin-left: 0; margin-right: 0; } img { max-width: 100%; } </style> </body> </html>';
}
