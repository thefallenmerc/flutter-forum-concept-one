import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SeamlessWebView extends StatefulWidget {
  String content;

  SeamlessWebView(this.content);

  @override
  _SeamlessWebViewState createState() => _SeamlessWebViewState();
}

class _SeamlessWebViewState extends State<SeamlessWebView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: WebView(
        initialUrl: "https://shubhamschahar.com",
        onWebViewCreated: (WebViewController controller) async {
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
