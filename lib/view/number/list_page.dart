import 'dart:collection';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _GiaiThuaState createState() => _GiaiThuaState();
}

class _GiaiThuaState extends State<ListPage> {
  TextEditingController _numberController;
  int numberShow = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var number = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính toán"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _numberController,
            decoration: InputDecoration(hintText: "Nhập số"),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                number = int.parse(_numberController.text);
                numberShow = checkGiaiThua(number);
              });
            },
            child: Text("Tính"),
          ),
          Text("Kết quả là:${numberShow}")
        ],
      ),
    );
  }

  int checkGiaiThua(int number1) {
    if (number1 == 0) {
      return 1;
    } else {
      return number1 * checkGiaiThua(number1 - 1);
    }
  }

}
