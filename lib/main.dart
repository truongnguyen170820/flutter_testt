import 'package:flutter/material.dart';
import 'package:flutter_testt/equation.dart';
import 'package:flutter_testt/sigin_account.dart';
import 'package:flutter_testt/tertiary.dart';
import 'package:flutter_testt/utils/screen/screen_utils.dart';
import 'package:flutter_testt/view/driver_license_page.dart';
import 'package:flutter_testt/view/ensign_view.page.dart';
import 'package:flutter_testt/view/number/list_page.dart';
import 'package:flutter_testt/view/number/number_page.dart';
import 'package:flutter_testt/view/shop/shop_page.dart';
import 'package:flutter_testt/view/soccerView/Soccer_Main_Page.dart';
import 'package:flutter_testt/view/test/test_page.dart';
import 'package:flutter_testt/view_image.dart';

void main() {
  // List<int> list = [1, 2, 3, 4, 6, 7, 8, 9];
  // List<int> list2 = [1, 3, 4, 5, 8, 12, 13, 14];
  //
  // var dataLisst = [];
  // for(int i = 0; i< list.length; i++){
  // list2.forEach((element) {
  //   if(element == list[i]){
  //     dataLisst.add(element);
  //   }
  // });
  // }
  // print(dataLisst);

// list.forEach((element) {
//   if(element % 2 == 0){
//     dataLisst.add(element);
//     print("số chẵn list ${element}");
//   }
// });
//
// list2.forEach((element) {
//   if(element % 2 == 0){
//     dataLisst.add(element);
//     print("số chẵn list1 ${element}");
//   }
// });
//
//
//
// int count = 0;
// list[0] = list2[0];
//   dataLisst.where((element) => element% 2 == 0).toList();
//   print("số chẵn ${dataLisst}");
// for(int i =0; i < dataLisst.length; i++ ){
//
// }
// for(int i = 0; i < count; i++){
//   print(list[i]);
//
// }

  runApp(MyApp());
  //sắp xếp theo thứ tự
  // var listCheck = [1, 4, 18, 8, 9, 3, 2, 7, 15, 10];
  //
  // for (int i = 0; i < listCheck.length; i++) {
  //
  //   for (int j = i + 1; j < listCheck.length; j++) {
  //     // thực hiện trao đổi vị trí
  //
  //     if (listCheck[j].compareTo(listCheck[i]) < 0) {
  //       int temp = listCheck[j]; // sự dụng 1 biết tạm thời để check
  //       listCheck[j] = listCheck[i];
  //       listCheck[i] = temp;
  //
  //     }
  //   }
  //   print(listCheck[i]);
  // }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
        debugShowCheckedModeBanner: false,

        builder: (BuildContext context, Widget child) {
      final data =
      MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
      ScreenUtil.init(context,
          width: 375, height: 667, allowFontScaling: true);
      return MediaQuery(data: data, child: child);
    },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body:
      Column(
        children: [
          RaisedButton(
              child: Text("Bậc 2"),
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Equation()));
          }),
          RaisedButton(
              child: Text("Image"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ViewImage()));
              }),
          RaisedButton(
              child: Text("Image"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DriverLicensePage()));
              }),

          RaisedButton(
              child: Text("Number"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NumberPage()));
              }),
          RaisedButton(
              child: Text("Giai thừa"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
              }),
          RaisedButton(
              child: Text("Shop"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage()));
              }),
          RaisedButton(
              child: Text("Soccer"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EnSignPage()));
              })
        ],
      ),

    );
  }
}
