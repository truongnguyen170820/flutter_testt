import 'package:flutter/material.dart';
import 'package:flutter_testt/sigin_account.dart';
import 'package:flutter_testt/utils/showMessage.dart';
import 'package:flutter_testt/utils/validator_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigupAccount extends StatefulWidget {
  @override
  _SigupAccountState createState() => _SigupAccountState();
}

class _SigupAccountState extends State<SigupAccount> {
  TextEditingController _emailSigUpController;
  TextEditingController _passwordSigUpController;
  TextEditingController _password2SigUpController;
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    _emailSigUpController = TextEditingController();
    _passwordSigUpController = TextEditingController();
    _password2SigUpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sigup"),
      ),
      body: Column(
        children: [
          SizedBox(height: 150),
          Container(
            margin: EdgeInsets.only(left: 30),
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 1),
            ),
            child: TextField(
              controller: _emailSigUpController,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "Enter Email address",
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 10),
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 1),
            ),
            child: TextField(
              controller: _passwordSigUpController,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "password",
                fillColor: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 10),
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 1),
            ),
            child: TextField(
              controller: _password2SigUpController,
              textAlignVertical: TextAlignVertical.bottom,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                hintText: "password",
                fillColor: Colors.white,
              ),
            ),
          ),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.pinkAccent,
              child: Text("Sigup"),
              onPressed: () {
                showDialogSigUp();
              }),
        ],
      ),
    );
  }

  showDialogSigUp() async {
    if (!Validator.instance.IsEmail(_emailSigUpController.text)) {
      showMessage(context, "Email không hợp lệ");
      return;
    }
    if (_passwordSigUpController.text.isEmpty) {
      showMessage(context, "Bạn chưa nhập mật khẩu");
      return;
    }
    if (_password2SigUpController.text.isEmpty) {
      showMessage(context, "Bạn chưa nhập lại mật khẩu");
      return;
    }
    if(_emailSigUpController.text !=null) {
      Usertruong.email = _emailSigUpController.text??'';
    }
    if(_passwordSigUpController.text !=null) {
      Usertruong.password = _passwordSigUpController.text??'';
    }
    Navigator.pop(context);
  }
}

class Information {
  String email;
  String password;

  Information({this.email, this.password});
}

