class ForumData {
  Employee employee;
  Forum forum;

  ForumData({this.employee, this.forum});

  ForumData.fromJson(Map<String, dynamic> json) {
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    forum = json['forum'] != null ? new Forum.fromJson(json['forum']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    if (this.forum != null) {
      data['forum'] = this.forum.toJson();
    }
    return data;
  }
}

class Employee {
  String userId;
  String firstName;

  Employee({this.userId, this.firstName});

  Employee.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['FirstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['FirstName'] = this.firstName;
    return data;
  }
}

class Forum {
  int id;
  String moduleName;
  String lang;
  String title;
  String content;
  List<Comments> comments;

  Forum(
      {this.id,
      this.moduleName,
      this.lang,
      this.title,
      this.content,
      this.comments});

  Forum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    moduleName = json['moduleName'];
    lang = json['lang'];
    title = json['title'];
    content = json['content'];
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['moduleName'] = this.moduleName;
    data['lang'] = this.lang;
    data['title'] = this.title;
    data['content'] = this.content;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int id;
  String comment;
  String userId;
  bool isByMe;
  Employee employee;
  String createdAt;
  List<String> upvotes;
  List<Comments> replies;

  Comments(
      {this.id,
      this.comment,
      this.userId,
      this.isByMe,
      this.employee,
      this.createdAt,
      this.upvotes,
      this.replies});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['userId'];
    isByMe = json['isByMe'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    createdAt = json['created_at'];
    upvotes = json['upvotes'].cast<String>();
    if (json['replies'] != null) {
      replies = new List<Comments>();
      json['replies'].forEach((v) {
        replies.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['userId'] = this.userId;
    data['isByMe'] = this.isByMe;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    data['created_at'] = this.createdAt;
    data['upvotes'] = this.upvotes;
    if (this.replies != null) {
      data['replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommentEmployee {
  String firstName;

  CommentEmployee({this.firstName});

  CommentEmployee.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    return data;
  }
}
