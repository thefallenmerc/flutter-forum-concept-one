import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterForum2/models/forum.model.dart';
import 'package:flutterForum2/widgets/seamless-webview.widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ForumBody extends StatelessWidget {
  final ForumData forumData;
  ForumBody({this.forumData}) : super();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _backButton(),
                _forumContent(context, forumData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_backButton() {
  return Container(
    padding: EdgeInsets.only(
      bottom: 10,
    ),
    child: Icon(
      Icons.arrow_back,
      size: 30,
    ),
  );
}

_forumContent(BuildContext context, ForumData forumData) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          forumData.forum.moduleName, // Forum Course Name
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
        Text(
          forumData.forum.title + " 2",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Divider(
          height: 20,
        ),
        SeamlessWebView(forumData.forum.content)
      ],
    ),
  );
}
