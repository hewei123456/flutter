import 'package:flutter/material.dart';

class MineView extends StatefulWidget {
  _StatefulGroup createState() => _StatefulGroup();
}

class _StatefulGroup extends State<MineView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('mine');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'mine',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              '我的'
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                'MineView',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}