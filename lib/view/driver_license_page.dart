import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testt/api/driver_api.dart';
import 'package:flutter_testt/model/driver_license.dart';
import 'package:flutter_testt/model/driver_request.dart';
import 'package:flutter_testt/utils/showMessage.dart';

class DriverLicensePage extends StatefulWidget {
  @override
  _DriverLicensePageState createState() => _DriverLicensePageState();
}

class _DriverLicensePageState extends State<DriverLicensePage> {
  List<DriverLicense> listDriver = [];
  List<DriverRequest> listRequeDriver = [];
  bool isClick = false;


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Các mẹo lý thuyết"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.blueAccent,
            child: Text(
              "Lý thuyết",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              builder: (context, snapshot) {
                var showData = json.decode(snapshot.data.toString());
                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            listDriver.forEach((element) {
                              // element.zPK = ;
                            });
                            isClick = !isClick;
                          });
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(showData[index]['ZNAME'] ?? ""),
                                Spacer(),
                                Icon(Icons.arrow_drop_down_outlined),
                              ],
                            ),
                            isClick ? SizedBox() :
                            Container(
                                    height: size.height,
                                    child: FutureBuilder(
                                      builder: (context, snapshot) {
                                        var showData =
                                            json.decode(snapshot.data.toString());
                                        return ListView.builder(
                                          // itemCount: 6,
                                          physics: BouncingScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return
                                              Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(8),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1, color: Colors.grey)
                                                  ),
                                                    width: size.width,
                                                    child: Text(
                                                      showData[index]['ZCONTENT'] ??
                                                          "",
                                                      style:
                                                          TextStyle(fontSize: 15),
                                                      overflow:
                                                          TextOverflow.clip,
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      future: DefaultAssetBundle.of(context)
                                          .loadString("assets/json/tip.json"),
                                    ),
                                  ),
                          ],
                        )
                    );
                  },
                );
              },
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/json/tip_cate.json"),
            ),
          )
        ],
      ),
    );
  }
}
