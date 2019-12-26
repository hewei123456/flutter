import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailView extends StatefulWidget {
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailView>
    with SingleTickerProviderStateMixin {
  double moveX = 0.0, moveY = 0.0;
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              child: Text(
                'Start',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                controller.reset();
                controller.forward();
              },
            ),
            GrowTransition(child: LogoWidget(), animation: animation),
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
          ])),
    );
  }
}

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
            child: child,
            width: animation.value,
            height: animation.value,
          ),
      child: child,
    );
  }
}
