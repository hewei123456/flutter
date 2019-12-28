import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/search.dart';
import 'package:flutter_app/views/mine.dart';

class TabNavigator extends StatefulWidget {
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _current = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (current) {
          setState(() {
            _current = current;
          });
        },
        children: <Widget>[
          HomeView(),
          SearchView(),
          MineView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        onTap: (current) {
          setState(() {
            _current = current;
            _controller.jumpToPage(current);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey),
              activeIcon: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              title: Text('搜索')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey),
              activeIcon: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('我的')),
        ],
      ),
    );
  }
}
