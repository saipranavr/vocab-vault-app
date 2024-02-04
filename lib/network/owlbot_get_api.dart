import 'dart:convert';

import 'package:http/http.dart';

class OwlBotGetAPI {
  final String _url = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  Future<List<dynamic>> searchWord(String word) async {
    Response response = await get(Uri.parse(_url + word.trim()));
    return json.decode(response.body);
  }
}