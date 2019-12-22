import 'package:flutter/material.dart';
import 'package:flutter_app/views/Index/index.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      home: new IndexView(),
    );
  }
}

void main() => runApp(MainView());