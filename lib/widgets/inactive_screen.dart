import 'package:flutter/material.dart';

class BlackScreen extends StatelessWidget {
  const BlackScreen({
    Key? key,
    this.onTap = false,
  }) : super(key: key);

  final bool onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: GestureDetector(
        onTap: onTap
            ? () {
                Navigator.of(context).pop();
              }
            : null,
        child: const Center(
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}