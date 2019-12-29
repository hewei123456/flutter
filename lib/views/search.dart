import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/college.dart';

class SearchView extends StatefulWidget {
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchView> {
  List _colleges;

  /*--------requests--------*/
  Future _fetchColleges() async {
    final response = await http.get(
      'http://47.94.214.83/api/college/',
    );
    CollegesModel _collegesModel =
        CollegesModel.fromJson(jsonDecode(response.body));
    if (mounted)
      setState(() {
        _colleges = _collegesModel.data.toList();
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
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await _fetchColleges();
              },
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: _colleges == null ? 0 : _colleges.length,
                    itemBuilder: (context, i) {
                      return ListTile(title: Text(_colleges[i].name));
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
