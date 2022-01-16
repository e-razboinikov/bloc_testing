import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserApiProvider {
  final String _url = 'https://jsonplaceholder.typicode.com/users/';

  Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> decodedJson = json.decode(response.body);
      final List<User> users =
          decodedJson.map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw ('Error fetching users');
    }
  }
}
