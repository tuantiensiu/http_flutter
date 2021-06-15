import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';
import 'dart:io';

class HttpService {
  final String postsURL =
      // "https://masters.instructure.com/api/v1/course_accounts";
      "https://jsonplaceholder.typicode.com/posts";
  //
  //

  String token =
      '2429~p5e8I11zFpZGu0Jupjuehif7Olxhf6uQmuGaaz4cSHTFlvC619g9obdDcgZHXJwH';

  final parameter = {
    'enrollment_type': 'teacher',
  };
  Future<List<Post>> getPosts() async {
    final res = await http.get(
      // Uri.parse(postsURL)
      // Uri.http('masters.instructure.com', '/api/v1/courses',
      //     {'enrollment_type': 'teacher'}),
      Uri.https('masters.instructure.com', '/api/v1/courses', parameter),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    );
    if (res.statusCode == 200) {
      // List<dynamic> body = jsonDecode(res.body);
      print(jsonDecode(res.body));
      // List<Post> posts = body
      //     .map(
      //       (dynamic item) => Post.fromJson(item),
      //     )
      //     .toList();

      // return posts;
    } else {
      print(res.statusCode);

      throw "Unable to retrieve posts.";
    }
  }
}
