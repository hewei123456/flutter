import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeView extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  /*---------state---------*/
  List _imageList = [
    'http://47.94.214.83/api/media/carousel_00.jpg',
    'http://47.94.214.83/api/media/carousel_01.jpg',
    'http://47.94.214.83/api/media/carousel_02.jpg',
    'http://47.94.214.83/api/media/carousel_03.jpg',
  ];
  double _appBarAlph = 0;
  double _bannerHeight = 160;

  /*---------methods---------*/
  _onScroll(offset) {
    double alpha = offset / 100;
    if (alpha < 0)
      alpha = 0;
    else if (alpha > 1) alpha = 1;

    setState(() {
      _appBarAlph = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // 移除ListView距离屏幕顶部的间距
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                  // 监听ListView滚动
                  onNotification: (scrollNotification) {
                    // 滚动且为列表滚动的时候
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: _bannerHeight,
                        child: Swiper(
                          itemCount: _imageList.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) =>
                              (Image.network(
                                _imageList[index],
                                fit: BoxFit.fill,
                              )),
                          pagination: SwiperPagination(),
                        ),
                      ),
                      Container(
                        height: 5000,
                      )
                    ],
                  ))),
          Opacity(
            opacity: _appBarAlph,
            child: Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text('首页'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
