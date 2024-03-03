import 'package:flutter/material.dart';

class DefinitionCard extends StatelessWidget {
  final String phoneticText;
  final Map<String, dynamic> meaningData;

  const DefinitionCard({Key? key, required this.phoneticText, required this.meaningData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Phonetic: $phoneticText',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Part of Speech: ${meaningData['partOfSpeech']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Definitions:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (meaningData['definitions'] as List<dynamic>).map((definition) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- ${definition['definition']}',
                      ),
                      const SizedBox(height: 8),
                      if (definition['example'] != null)
                        Text(
                          'Example: ${definition['example']}',
                        ),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
