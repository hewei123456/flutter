import 'package:flutter/material.dart';
import 'package:flutter_app/navigator/tabNavigator.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main',
      home: TabNavigator(),
    );
  }
}

void main() => runApp(MainView());
