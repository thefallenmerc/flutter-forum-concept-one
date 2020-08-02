import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterForum2/models/forum.model.dart';
import 'package:flutterForum2/widgets/comment-list-view.widget.dart';
import 'package:flutterForum2/widgets/reply-box.widget.dart';
import 'package:flutterForum2/widgets/seamless-webview.widget.dart';

class ForumBody extends StatelessWidget {
  final ForumData forumData;
  ForumBody({this.forumData}) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: 20,
                    ),
                    _forumContent(context, forumData),
                  ],
                ),
              ),
              _numberOfComments(context, forumData.forum.comments.length),
              SizedBox(
                height: 20,
              ),
              CommentListView(forumData.forum.comments, forumData.employee),
              // Sized box escaping reply box
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
        ReplyBox(),
      ],
    );
  }
}

_backButton() {
  return InkWell(
    onTap: () => SystemNavigator.pop(),
    child: Container(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Icon(
        Icons.arrow_back,
        size: 30,
      ),
    ),
  );
}

_forumContent(BuildContext context, ForumData forumData) {
  return Container(
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
        SeamlessWebView(forumData.forum.content),
      ],
    ),
  );
}

_numberOfComments(BuildContext context, int count) {
  return Container(
    width: MediaQuery.of(context).size.width,
    color: Color(0xffE3E3E3),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    child: Text(
      count.toString() + " comment" + (count == 1 ? "" : "s"),
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
