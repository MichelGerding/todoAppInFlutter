import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpHandler {
  static Future<String> fetchPost(int userId) async {
    var response = await http.get(
      'http://192.168.2.113/php/app-api/todo/getTodos.php?uid=' +
          userId.toString(),
    );
    // print(response.body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String> updatePosts({int userId, int postId, var data}) async {
    await http.post(
      'http://192.168.2.113/php/app-api/todo/updateTodo.php',
      body: {
        'userId': userId,
        'postId': postId,
        'data': json.encode(data),
      },
    );

    return await HttpHandler.fetchPost(userId);
  }

  static Future<String> deletePost({int postId, int userId}) async {
    await http.get(
      'http://192.168.2.113/php/app-api/todo/removeTodo.php?postId=' +
          postId.toString(),
    );

    return await HttpHandler.fetchPost(userId);
  }

  static Future<String> addPost({int userId, var data}) async {
    await http.post(
      'http://192.168.2.113/php/app-api/todo/addTodo.php',
      body: {
        'userId': userId,
        'data': json.encode(data),
      },
    );

    return await HttpHandler.fetchPost(userId);
  }
}
