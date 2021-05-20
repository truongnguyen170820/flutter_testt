import 'package:flutter/material.dart';
import 'package:flutter_testt/utils/showMessage.dart';


class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
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
                for (int i = 0; i < 10; i++) {
                  checkSo(i);
                }
              });
            },
            child: Text("="),
          ),
          Text("Kết quả là: ${numberShow}")
        ],
      ),
    );
  }

  Widget checkSo(int number) {
    int f0 = 0 ;
    int f1 = 1 ;
    int fn = 1 ;
    number = int.parse(_numberController.text);
    if (number <= 0) {
      // numberShow = -1;
    } else if (number == 0 || number == 1) {
      numberShow = number;
    } else {
      for (int i = 2; i < number; i++) {
        f0 = f1;
        f1 = fn;
        fn = f0 + f1;
        numberShow = fn;
      }
    }
  }
}
