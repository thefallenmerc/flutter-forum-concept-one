import 'package:flutterForum2/models/forum.model.dart';
import "package:http/http.dart" as http;
import "dart:convert";

Future<ForumData> fetchForum() async {
  final response = await http
      .get("", headers: {
    "Authorization":
        ""
  });
  return ForumData.fromJson(json.decode(response.body));
}
