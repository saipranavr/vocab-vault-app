import 'package:flutter/material.dart';
import 'package:dictionary/widgets/home_page/search_bar.dart';
import 'package:dictionary/widgets/home_page/definition_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VocabVault',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'VocabVault',
        definitionsCallback: (definitions) {},
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.definitionsCallback,
  }) : super(key: key);

  final String title;
  final Function(List<dynamic>) definitionsCallback;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> _definitions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VocabVault'),
      ),
      body: Column(
        children: [
          SearchBar(
            definitionsCallback: (definitions) {
              setState(() {
                _definitions = definitions;
              });
            },
          ),
          Expanded(
            child: DefinitionList(definitions: _definitions),
          ),
        ],
      ),
    );
  }
}
