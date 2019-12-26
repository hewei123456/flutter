import 'package:flutter/material.dart';

class HeroView extends StatefulWidget {
  _HeroState createState() => _HeroState();
}

class _HeroState extends State<HeroView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hero');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hero动画'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              'hero动画',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
