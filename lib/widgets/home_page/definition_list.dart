import 'package:flutter/material.dart';
import 'package:dictionary/widgets/home_page/definition_card.dart';

class DefinitionList extends StatelessWidget {
  final List<dynamic> definitions;

  const DefinitionList({Key? key, required this.definitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: definitions.length,
      itemBuilder: (BuildContext context, int index) {
        return DefinitionCard(definition: definitions[index]);
      },
    );
  }
}