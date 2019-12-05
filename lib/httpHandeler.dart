import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models/todoModel.dart';

class HttpHandler {
  static Future<String> fetchPost(int userId) async {
    var response = await http.post(
      'http://192.168.2.113/php/app-api/todo/getTodos.php',
      body: {
        'userid': userId.toString(),
      },
    );
    // print(response.body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  List<TodoModel> _getPosts(int uid) {
    Future<String> jsonStrF = HttpHandler.fetchPost(uid);
    jsonStrF.then((jsonStr) {
      List<dynamic> jsonO = json.decode(jsonStr);

      List<TodoModel> todos = [];
      for (var obj in jsonO) {
        todos.add(TodoModel.fromJson(obj));
      }
      return todos;
    });
    print("failed to get posts");
  }

  static Future<TodoModel> updatePosts(
      {int userId, int postId, var data}) async {
    await http.post(
      'http://192.168.2.113/php/app-api/todo/getTodos.php',
      body: {
        'userId': userId,
        'postId': postId,
        'data': json.encode(data),
      },
    );

    // return await HttpHandler.fetchPost(userId);
  }
}
