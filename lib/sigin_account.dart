import 'package:flutter/material.dart';
import 'package:flutter_testt/equation.dart';
import 'package:flutter_testt/showList.dart';
import 'package:flutter_testt/sigup_account.dart';
import 'package:flutter_testt/utils/utilites.dart';
import 'package:shared_preferences/shared_preferences.dart';

Information Usertruong = Information(); // biến để Lưu Infor khi người dùng nhập
class SiginAccount extends StatefulWidget {
  final Information information;

  const SiginAccount({Key key, this.information}) : super(key: key);

  @override
  _SiginAccountState createState() => _SiginAccountState();
}

class _SiginAccountState extends State<SiginAccount> {
  SharedPreferences spfs;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Container(
            margin: EdgeInsets.only(left: 30),
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54, width: 1),
            ),
            child: TextField(
              controller: _emailController,
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
              controller: _passwordController,
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
              child: Text("Login"),
              onPressed: () {
                _showAlertDialog(context);
              }),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SigupAccount()));
              },
              child: Text("Dont have account yet?"))
        ],

      ),
    );
  }

  _showAlertDialog(BuildContext context){
    if (_emailController.text.isEmpty || _emailController.text != Usertruong.email) {
      Utilites.showToast(context, "Vui lòng kiểm tra lại Email!");
      return;
    }
    if (_passwordController.text.isEmpty || _passwordController.text != Usertruong.password) {
      Utilites.showToast(context, "Vui lòng kiểm trả lại mật khẩu");
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowList()));
  }
}
