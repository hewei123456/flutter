import 'package:flutter/material.dart';
import 'package:flutter_app/views/Index/home.dart';
import 'package:flutter_app/views/Index/cart.dart';
import 'package:flutter_app/views/Index/mine.dart';
import 'package:flutter_app/views/Detail/index.dart';

class IndexView extends StatefulWidget {
  @override
  _StatefulGroup createState() => _StatefulGroup();
}

class _StatefulGroup extends State<IndexView> {
  int _currentIndex = 0;
  String contentText;
  BuildContext _context;

  /*=======methods========*/
  _navigateToDetail() {
    Navigator.push(_context, new MaterialPageRoute(
      builder: (context) => new DetailView(),
    ));
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
            icon: Icon(Icons.home, color: Colors.grey,),
            activeIcon: Icon(Icons.home, color: Colors.blue,),
            title: Text('首页')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.grey,),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.blue,),
            title: Text('购物车')
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey,),
            activeIcon: Icon(Icons.person, color: Colors.blue,),
            title: Text('我的')
        )
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
    _context = context;

    return MaterialApp(
      title: 'index',
      home: Scaffold(
          bottomNavigationBar: _renderBottomNavigationBar(),
          body: MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.blue
            ),
            home: _renderCurrentView(),
          )
      ),
    );
  }
}