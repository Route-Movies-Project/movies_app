import 'package:flutter/material.dart';

void main() {
  runApp(const Movies());
}

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      routes: {},
    );
  }
}
