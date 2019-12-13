import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Users.dart';

const baseUrl = "http://13.234.238.175:8000";

class API {
  static Future getUsers() {
    var url = baseUrl + "/transaction?_sort=id&_order=desc";
    return http.get(url);
  }
}

Future<User> createPost({Map body}) async {
  var url = baseUrl + "/transaction";
  print("-------");
  print(body);
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;
 
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));
  });
}
