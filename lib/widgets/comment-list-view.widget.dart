import 'package:flutter/material.dart';
import 'package:flutterForum2/models/forum.model.dart';

class CommentListView extends StatelessWidget {
  final List<Comments> comments;
  final Employee employee;

  CommentListView(this.comments, this.employee);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: comments
          .map(
            (e) => _buildCommentView(context, e, employee,
                isFirst: comments.indexOf(e) == 0),
          )
          .toList(),
    );
  }
}

Widget _buildCommentView(BuildContext context, Comments c, Employee e,
    {bool nested = false, isFirst = false}) {
  return Column(
    children: [
      nested
          ? Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Divider(),
            )
          : isFirst ? SizedBox.shrink() : Divider(),
      Container(
        padding: EdgeInsets.symmetric(horizontal: nested ? 0 : 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCircleAvatar(c),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Holds all the comment info like user name, created at, edit, delete
                  Row(
                    children: [
                      _buildEmployeeNameWidget(c),
                      SizedBox(
                        width: 7,
                      ),
                      _buildCreatedAt(c),
                      SizedBox(
                        width: 7,
                      ),
                      _buildEditButton(),
                      SizedBox(
                        width: 7,
                      ),
                      _buildDeleteButton(),
                    ],
                  ),
                  _buildCommentContainer(context, nested, c),
                  Row(
                    children: [
                      _buildUserAvatar(c),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: !c.upvotes.contains(e.userId)
                            ? Colors.green
                            : Colors.grey[400],
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: c.upvotes.contains(e.userId)
                            ? Colors.red
                            : Colors.grey[400],
                      ),
                      SizedBox(width: 5),
                      _buildReplyButton(),
                    ],
                  ),
                  nested
                      ? SizedBox.shrink()
                      : Column(
                          children: c.replies
                              .map(
                                (r) => _buildCommentView(context, r, e,
                                    nested: true,
                                    isFirst: c.replies.indexOf(r) == 0),
                              )
                              .toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}

CircleAvatar _buildCircleAvatar(Comments c) {
  return CircleAvatar(
    radius: 15,
    child: Text(c.employee.firstName[0]),
  );
}

Text _buildEmployeeNameWidget(Comments c) {
  return Text(
    c.employee.firstName,
    style: TextStyle(
      fontWeight: FontWeight.w500,
    ),
  );
}

Text _buildCreatedAt(Comments c) {
  return Text(
    c.createdAt,
    style: TextStyle(
      color: Colors.black26,
    ),
  );
}

Container _buildCommentContainer(
    BuildContext context, bool nested, Comments c) {
  return Container(
    width: MediaQuery.of(context).size.width -
        (nested ? 160 : 100), // 100 is 40 + 30 + 30
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Text(
      c.comment,
      style: TextStyle(
        fontSize: 17,
        color: Colors.black87,
      ),
    ),
  );
}

InkWell _buildReplyButton() {
  return InkWell(
    child: Text(
      "REPLY",
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      ),
    ),
  );
}

CircleAvatar _buildUserAvatar(Comments c) {
  return CircleAvatar(
    radius: 8,
    foregroundColor: Colors.grey[800],
    backgroundColor: Colors.grey[400],
    child: Text(
      c.upvotes.length.toString(),
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

InkWell _buildDeleteButton() {
  return InkWell(
    child: Text(
      "Delete",
      style: TextStyle(
        color: Colors.black26,
      ),
    ),
  );
}

InkWell _buildEditButton() {
  return InkWell(
    child: Text(
      "Edit",
      style: TextStyle(
        color: Colors.black26,
      ),
    ),
  );
}
