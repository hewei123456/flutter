import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final navigateToDetail;

  const HomeView({Key key, this.navigateToDetail}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('home');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '首页'
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
              '首页',
              style: TextStyle(fontSize: 20),
            ),
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('跳转详情'),
              onPressed: () {
                setState(() {
                  widget.navigateToDetail();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}