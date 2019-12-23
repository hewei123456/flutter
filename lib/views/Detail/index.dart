import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  _StatefulGroup createState() => _StatefulGroup();
}

class _StatefulGroup extends State<DetailView> {
  double moveX = 0.0, moveY = 0.0;

  /*--------methods--------*/
  _move(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('详情页'),
        ),
        body: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage('static/carousel_00.jpg'),
              ),
            ),
          ],
        ));
  }
}
