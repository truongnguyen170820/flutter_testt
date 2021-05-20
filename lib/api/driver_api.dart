import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testt/model/driver_license.dart';

class DriverApi{
  static Future<List<DriverLicense>> getDriverLocal(BuildContext context) async{
    final assetsBundel = DefaultAssetBundle.of(context);
    final data = await assetsBundel.loadString("assets/json/tip_cate.json");
    final body = json.decode(data);
    return body;
  }
}