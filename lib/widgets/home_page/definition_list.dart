import 'package:flutter/material.dart';
import 'package:dictionary/widgets/home_page/definition_card.dart';

class DefinitionList extends StatelessWidget {
  final List<dynamic> wordsData;
  final VoidCallback resetTimerCallback;

  const DefinitionList({Key? key, required this.wordsData, required this.resetTimerCallback,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: wordsData.map((wordData) {
        return WordDefinitionCard(wordData: wordData, resetTimerCallback: resetTimerCallback);
      }).toList(),
    );
  }
}

class WordDefinitionCard extends StatelessWidget {
  final Map<String, dynamic> wordData;
  final VoidCallback resetTimerCallback;

  const WordDefinitionCard({
    Key? key,
    required this.wordData,
    required this.resetTimerCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String word = wordData['word'];
    final List<dynamic> phonetics = wordData['phonetics'];
    final List<dynamic> meanings = wordData['meanings'];

    return Column(
      children: [
        Text(
          'Word: $word',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        GestureDetector(
          onPanUpdate: (details) {
            resetTimerCallback();
          },
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: phonetics.length,
            itemBuilder: (BuildContext context, int index) {
              final String phoneticText = phonetics[index]['text']?.toString() ?? 'N/A';
              final Map<String, dynamic> meaningData = meanings[index];

              return DefinitionCard(
                phoneticText: phoneticText,
                meaningData: meaningData,
              );
            },
          ),
        ),
      ],
    );
  }
}
