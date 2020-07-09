import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footScore/src/widgets/team_result.dart';
import 'package:footScore/src/widgets/scroll_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ScrollHeader(),
          Result()
        ],
      )),
    );
  }
}
