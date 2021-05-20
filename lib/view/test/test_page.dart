import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/color_utils.dart';
import 'package:flutter_testt/utils/global.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: setHeight(50)),
          Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.lightBlueAccent, width: 2)
                  ),
                  child: Image.asset(getAssetsImage("rank2.png"), width: setWidth(36),height: setHeight(36))),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorUtils.WHITE_TEXT,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)
                    ),
                      child: Image.asset(getAssetsImage("tickRank.png"), width: setWidth(13),height: setHeight(13)))),
            ],
          ),
          // Image.asset(getAssetsImage("rank2.png"), width: setWidth(36),height: setHeight(36))
        ],
      ),
    );
  }
}
