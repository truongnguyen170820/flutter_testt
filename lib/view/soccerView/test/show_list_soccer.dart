import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/custom_appbar.dart';

class ShowListSoccer extends StatefulWidget {
  @override
  _ShowListSoccerState createState() => _ShowListSoccerState();
}

class _ShowListSoccerState extends State<ShowListSoccer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarDefault(context, "hi"),
    );
  }
}
