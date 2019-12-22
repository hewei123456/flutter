import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'detail',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('详情页'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          body: FractionallySizedBox(
            widthFactor: 1,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('手势监听');
                  },
                  child: Text('xiangqingye'),
                )
              ],
            ),
          )
      ),
    );
  }
}