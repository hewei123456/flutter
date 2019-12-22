import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  _StatefulGroup createState() => _StatefulGroup();
}

class _StatefulGroup extends State<CartView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('cart');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '购物车'
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
              'CartView',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}