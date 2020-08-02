import 'dart:math';

import 'package:flutter/material.dart';

class ReplyBox extends StatefulWidget {
  @override
  _ReplyBoxState createState() => _ReplyBoxState();
}

class _ReplyBoxState extends State<ReplyBox> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                offset: Offset(0, 0),
                color: Colors.black38,
                spreadRadius: 2)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15,
            ),
            topRight: Radius.circular(
              15,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // text
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Text(
                "Rate this exercise",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black26,
                  width: 2,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.insert_emoticon,
                      color: Colors.black87,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration.collapsed(
                            hintText: "Leave a comment here"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Transform.rotate(
                      angle: -pi / 4,
                      child: Icon(
                        Icons.send,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
