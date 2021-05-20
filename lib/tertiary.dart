import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/utilites.dart';

class Tertiary extends StatefulWidget {
  @override
  _TertiaryState createState() => _TertiaryState();
}

class _TertiaryState extends State<Tertiary> {
  TextEditingController _stnController;
  TextEditingController _sthController;
  TextEditingController _stbController;
  TextEditingController _sttController;
  @override
  void initState() {
    _stnController = TextEditingController();
    _sthController = TextEditingController();
    _stbController = TextEditingController();
    _sttController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bậc 3"),
      ),
      body:  Column(
        children: [
          Row(
            children: [
              SizedBox(width: 10),
              Container(
                // margin: EdgeInsets.only(bottom: 18),
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 15),
                  controller: _stnController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "STN",
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                // margin: EdgeInsets.only(bottom: 18),
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 15),
                  controller: _sthController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "STH",
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                // margin: EdgeInsets.only(bottom: 18),
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 15),
                  controller: _stbController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "STB",
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                // margin: EdgeInsets.only(bottom: 18),
                height: 60,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54, width: 1),
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(fontSize: 15),
                  controller: _sttController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "STB",
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          RaisedButton(
              child: Text("Tính"),
              onPressed: () {
                _showAlertDialog(context);
              }),
        ],
      ),
    );
  }
  _showAlertDialog(BuildContext context){
    if (_stnController.text == '') {
      Utilites.showToast(context, "bạn chưa nhập STN");
      return;
    }
    if (_sthController.text == '') {
      Utilites.showToast(context, "bạn chưa nhập STH");
      return;
    }
    if (_stbController.text == '') {
      Utilites.showToast(context, "bạn chưa nhập STB");
      return;
    }
    if (_sttController.text == '') {
      Utilites.showToast(context, "bạn chưa nhập STT");
      return;
    }

    var a = double.parse(_stnController.text);
    var b = double.parse(_sthController.text);
    var c = double.parse(_stbController.text);
    var d = double.parse(_sttController.text);
  }
}
