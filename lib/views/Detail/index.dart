import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  _renderPageViewItem(String title, Color color) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: PhysicalModel(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          color: color,
          child: Text(title, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('详情页'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Image(
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                      image: AssetImage('static/avatar.jpg'),
                    ),
                  ),
                  ClipRRect(
                    child: Image(
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                      image: AssetImage('static/avatar.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
                ],
              ),
              Container(
                height: 200,
                child: PageView(
                  children: <Widget>[
                    _renderPageViewItem('page1', Colors.purple),
                    _renderPageViewItem('page2', Colors.blue),
                    _renderPageViewItem('page3', Colors.pink),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Image(
                    width: 200,
                    height: 120,
                    fit: BoxFit.fill,
                    image: AssetImage('static/carousel_00.jpg'),
                  ),
                  Positioned(
                    child: ClipOval(
                      child: Image(
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                        image: AssetImage('static/avatar.jpg'),
                      ),
                    ),
                    right: 0,
                    top: 10,
                  )
                ],
              )
            ]));
  }
}
