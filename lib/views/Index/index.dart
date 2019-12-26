import 'package:flutter/material.dart';
import 'package:flutter_app/views/Index/home.dart';
import 'package:flutter_app/views/Index/cart.dart';
import 'package:flutter_app/views/Index/mine.dart';
import 'package:flutter_app/views/Detail/index.dart';

class IndexView extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<IndexView> {
  int _currentIndex = 0;
  String contentText;

  /*=======methods========*/
  _navigateToDetail() {
    Navigator.of(context).pushNamed('detail');
  }

  /*=======render========*/
  _renderCurrentView() {
    return [
      HomeView(navigateToDetail: () => _navigateToDetail()),
      CartView(),
      MineView()
    ][_currentIndex];
  }

  _renderBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text('首页')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.shopping_cart,
              color: Colors.blue,
            ),
            title: Text('购物车')),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: Text('我的'))
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: _renderBottomNavigationBar(),
        body: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: _renderCurrentView(),
        ));
  }
}
