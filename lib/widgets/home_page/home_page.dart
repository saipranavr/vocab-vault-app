import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dictionary/widgets/home_page/search_bar.dart';
import 'package:dictionary/widgets/home_page/definition_list.dart';
import 'package:dictionary/widgets/inactive_screen.dart';

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
  bool _showBlackScreen = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 25), () {
      if (!_showBlackScreen) {
        setState(() {
          _showBlackScreen = true;
        });
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showBlackScreen
          ? null
          : AppBar(
              title: const Text('VocabVault'),
            ),
      body: GestureDetector(
        onTap: () {
          _resetTimer();
        },
        onPanUpdate: (details) {
          _resetTimer();
        },
        child: Stack(
          children: [
            Column(
              children: [
                SearchBar(
                  definitionsCallback: (definitions) {
                    setState(() {
                      _definitions = definitions;
                    });
                    _resetTimer();
                  },
                  resetTimerCallback: _resetTimer,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: _definitions.map((wordData) {
                        return WordDefinitionCard(wordData: wordData, resetTimerCallback: _resetTimer);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            if (_showBlackScreen)
              BlackScreen(
                onTap: () {
                  setState(() {
                    _showBlackScreen = false;
                  });
                  _resetTimer();
                },
              ),
          ],
        ),
      ),
    );
  }
}
