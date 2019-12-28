import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/json/college.dart';

class SearchView extends StatefulWidget {
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchView> {
  List _colleges;

  /*--------requests--------*/
  Future<CollegeModel> _fetchColleges() async {
    final response = await http.get(
      'http://47.94.214.83/api/college/',
    );
    CollegeModel _collegeModel =
        CollegeModel.fromJson(jsonDecode(response.body));
    if (mounted)
      setState(() {
        _colleges = _collegeModel.data.toList();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              _fetchColleges();
            },
            child: Text('REQUEST'),
          ),
          Expanded(
            child: NotificationListener(
              onNotification: (scrollNotification) {},
              child: CollegesWidget(colleges: _colleges),
            ),
          )
        ],
      ),
    );
  }
}

class CollegesWidget extends StatelessWidget {
  CollegesWidget({this.colleges});

  List colleges;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: colleges == null ? 0 : colleges.length,
        itemBuilder: (context, i) {
          return ListTile(title: Text(colleges[i].name));
        });
  }
}
