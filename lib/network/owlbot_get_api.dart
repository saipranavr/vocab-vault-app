import 'dart:convert';

import 'package:http/http.dart';

class OwlBotGetAPI {
  final String _url = "https://owlbot.info/api/v4/dictionary/";
  final String _token = "e014ed619e6f5dd7b7544a9457fc7d322c9992d3";

  Future<Map<String, dynamic>> searchWord(String word) async {
    Response response = await get(Uri.parse(_url + word.trim()), headers: {"Authorization": "Token $_token"});
    return json.decode(response.body);
  }
}