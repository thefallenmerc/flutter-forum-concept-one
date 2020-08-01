import 'package:flutter/material.dart';
import 'package:flutterForum2/helpers/main.helper.dart';
import 'package:flutterForum2/models/forum.model.dart';
import 'package:flutterForum2/widgets/forum-body.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forum',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Color(0xff421840),
      ),
      home: Forum(title: "Forum"),
    );
  }
}

class Forum extends StatefulWidget {
  final String title;

  Forum({Key key, this.title}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  ForumData forumData;

  @override
  void initState() {
    super.initState();
    fetchForum().then((value) {
      print("setting state");
      setState(() {
        forumData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: forumData != null
            ? ForumBody(forumData: forumData)
            : Text("Loading"),
      ),
    );
  }
}
