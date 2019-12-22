import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  _StatefulGroup createState() => _StatefulGroup();
}

class _StatefulGroup extends State<DetailView> {
  double moveX = 0.0,
      moveY = 0.0;

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
        body: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                left: moveX,
                top: moveY,
                child: GestureDetector(
                  onPanUpdate: (e) => _move(e),
                  child: Image(
                    width: 750,
                    height: 100,
                    image: AssetImage('static/carousel_00.jpg'),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}