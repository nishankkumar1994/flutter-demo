import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models.dart';


class PostService {

  Future<List<Post>> fetchList() async {
    final response = await http.get(
        'https://jsonplaceholder.typicode.com/posts/'
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      Iterable list = json.decode(response.body);
      List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
      return posts;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load post');
    }
  }
}