import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_restfullapi/model/user_model.dart';

class UserService {
  final String url = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> getUser(int page) async {
    final response = await http.get(Uri.parse('$url?page=$page'));

    if (response.statusCode == 200) {
      print('$page');
      var jsonBody = jsonDecode(response.body);
      List<Character> characters = List<Character>.from(
          jsonBody['results'].map((model) => Character.fromJson(model))
      );
      return characters;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
