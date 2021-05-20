import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/showMessage.dart';


class Fibonaci extends StatefulWidget {
  @override
  _FibonaciState createState() => _FibonaciState();
}

class _FibonaciState extends State<Fibonaci> {
  TextEditingController _numberController;
  int numberShow = 0;
  // int f1 = 1 ;
  // int f2 = 1 ;
  // int fn = 1 ;

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
        title: Text("Number"),
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
                numberShow =checkSo(number);
              });
            },
            child: Text("="),
          ),
          Text("Kết quả là: ${numberShow}")
        ],
      ),
    );
  }

  int checkSo(int number) {
    if (number <= 0) {
      print('lỗi');
    } else if (number == 1 || number == 2) {
      return 1;
    } else {
      return checkSo(number-1) + checkSo(number-2);
    }
  }
}
