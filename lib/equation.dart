import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/utilites.dart';

class Equation extends StatefulWidget {
  @override
  _EquationState createState() => _EquationState();
}

class _EquationState extends State<Equation> {
  TextEditingController _stnController;
  TextEditingController _sthController;
  TextEditingController _stbController;
  bool isCheck = true;

  bool isCheck1 = false;

  @override
  void initState() {
    _stnController = TextEditingController();
    _sthController = TextEditingController();
    _stbController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phương Trình")),
      body: Column(
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Â');
                      if (isCheck == null) {
                        isCheck == true;
                      }
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(bottom: 18),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color:
                            isCheck == true ? Colors.pinkAccent : Colors.white,
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child:
                          Text('+', style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(bottom: 18),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color:
                            isCheck == false ? Colors.pinkAccent : Colors.white,
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child:
                          Text('-', style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                ],
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCheck1 = !isCheck1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(bottom: 18),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color:
                            isCheck1 == true ? Colors.pinkAccent : Colors.white,
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child:
                          Text('+', style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCheck1 = !isCheck1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(bottom: 18),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: isCheck1 == false
                            ? Colors.pinkAccent
                            : Colors.white,
                        border: Border.all(color: Colors.black54, width: 1),
                      ),
                      child:
                          Text('-', style: TextStyle(color: Colors.blueAccent)),
                    ),
                  ),
                ],
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

  _showAlertDialog(BuildContext context) {
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

    var a = double.parse(_stnController.text);
    var b = double.parse(_sthController.text);
    var c = double.parse(_stbController.text);


    double detal = b * b - 4 * a * c;
    double deltaSqrt = sqrt(detal);
    if (a != 0) {
      if (detal < 0) {
        return showDialog(
            context: context,
            child: AlertDialog(content: Text("Phương trình vô nghiệm")));
      } else if (detal == 0) {
        return showDialog(
            context: context,
            child: AlertDialog(
              content: Text("Phương trình nghiệm kép ${(-b / (2 * a))} "),
            ));
      } else {
        return showDialog(
            context: context,
            child: AlertDialog(
              content: Text(
                  "Phương trình có 2 nghiệm \n X1 = ${(-b + deltaSqrt) / 2 * a} \n X2 = ${(-b - deltaSqrt) / 2 * a} "),
            ));
      }
    } else {
      if (b == 0) {
        if (c == 0) {
          return showDialog(
              context: context,
              child: AlertDialog(content: Text("Phương trình vô số nghiệm")));
        } else {
          return showDialog(
              context: context,
              child: AlertDialog(content: Text("Phương trình vô nghiệm")));
        }
      }
      return showDialog(
          context: context,
          child:
              AlertDialog(content: Text("Phương trình có nghiệm ${-c / b}")));
    }
  }
}
