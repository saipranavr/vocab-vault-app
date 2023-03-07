import 'package:flutter/material.dart';

class DefinitionCard extends StatelessWidget {
  final Map<String, dynamic> definition;

  const DefinitionCard({Key? key, required this.definition}) : super(key: key);

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
              'Type: ${definition['type']}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Definition: ${definition['definition']}',
            ),
            const SizedBox(height: 8),
            Text(
              'Example: ${definition['example']}',
            ),
          ],
        ),
      ),
    );
  }
}
