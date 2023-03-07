import 'package:flutter/material.dart';

class BlackScreen extends StatelessWidget {
  final void Function() onTap;

  const BlackScreen({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}