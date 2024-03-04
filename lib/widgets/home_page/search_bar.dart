import 'package:flutter/material.dart';
import 'package:dictionary/network/owlbot_get_api.dart';

class SearchBar extends StatefulWidget {
  final Function(List<dynamic>) definitionsCallback;
  final VoidCallback resetTimerCallback;

  const SearchBar({required this.definitionsCallback, required this.resetTimerCallback,});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textController = TextEditingController();
  final OwlBotGetAPI owlBotGetAPI = OwlBotGetAPI();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        controller: _textController,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
        ),
        onSubmitted: (query) async {
          widget.resetTimerCallback();
          var response = await owlBotGetAPI.searchWord(query);
          widget.definitionsCallback(response);
        },
        onChanged: (query) {
          widget.resetTimerCallback();
        },
      ),
    );
  }
}
